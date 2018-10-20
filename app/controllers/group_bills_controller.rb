require "rest_client"

require "rexml/document"

class GroupBillsController < ApplicationController

  def index
    @users = User.all.map { |c| [ c.first_name, c.id] }
    @bill = Bill.new
  end

  def show
    @group_bill = GroupBill.find(params[:id])
    @users = User.all
    @users = User.all.map { |c| [ c.first_name, c.id] }
    @bill = Bill.new
    @items = @group_bill.items
    @admin= User.find(@group_bill.admin)
    
    @bills_on_group_bill=@group_bill.bills
    @users_on_group_bill=[]
    @bills_on_group_bill.each do |bill|
      bill.users.each do |user|
          @users_on_group_bill.push([user.first_name,user.id])
      end
    

    end


    
    
    # bills-items functionality 


    # @items = Item.all
    # @items = Item.all.map { |c| [ c.name, c.id] }
  end

  def new
    @group_bill=GroupBill.new
  end

  def edit
  end


  def new 
    @users = User.all.map{ |c| [ c.id] }
    @group_bill = GroupBill.new 
  end 


  def create
    @group_bill = GroupBill.create(
      admin: params[:group_bill][:admin],
      receipt: params[:group_bill][:receipt]
    )
    # image_tag @group_bill.receipt

    # session[:group_bill_id] = group_bill.id
    # call=OcrskdCall.new(@group_bill.image_url)
    # items_array=call.api_call
    items_array=api_call(@group_bill)
    
    items_array.each do |item|
      Item.create(
        name: item[0],
        price: item[1],
        group_bill_id: @group_bill.id
      )
    end
    redirect_to group_bill_path(@group_bill)

  end

  def update
  end

  def delete
  end

  ######################
    def api_call(group_bill_object)
        application_id = CGI.escape("BillSplitterApp")
        password = CGI.escape("Gc4wsceCBv8uDYh/TSEqjJkc")
        # file_name= Rails.root.to_s + ActionController::Base.helpers.asset_path('o.png')
        file_path=ActiveStorage::Blob.service.send(:path_for, group_bill_object.receipt.key)

        # file_name = Rails.root.to_s + "./o.png"
        language = "English"
        base_url = "http://#{application_id}:#{password}@cloud.ocrsdk.com"

        # Routine for OCR SDK error output
        def output_response_error(response)
            # Parse response xml (see http://ocrsdk.com/documentation/specifications/status-codes)
            xml_data = REXML::Document.new(response)
            error_message = xml_data.elements["error/message"]
            puts "Error: #{error_message.text}" if error_message
        end

        # Upload and process the image (see http://ocrsdk.com/documentation/apireference/processImage)
        puts "Image will be recognized with #{language} language."
        puts "Uploading file.."
        begin
            response = RestClient.post("#{base_url}/processImage?language=#{language}&exportFormat=txt", :upload => { 
                :file => File.new(file_path, 'rb') 
            })  
            rescue RestClient::ExceptionWithResponse => e
                # Show processImage errors
                output_response_error(e.response)
                raise
            else
                # Get task id from response xml to check task status later
                xml_data = REXML::Document.new(response)
                task_element = xml_data.elements["response/task"]
                task_id = task_element.attributes["id"]
                # Obtain the task status here so that the loop below is not started
                # if your application account has not enough credits
                task_status = task_element.attributes["status"]
        end

        # Get task information in a loop until task processing finishes
        puts "Waiting till image is processed.."
        while task_status == "InProgress" or task_status == "Queued" do
        begin
            sleep(5)

            raise "Invalid task id used when preparing getTaskStatus request"\
            if ((!(defined? task_id)) || task_id.nil? ||task_id.empty?|| (task_id.include? "00000000-0"))
                response = RestClient.get("#{base_url}/getTaskStatus?taskid=#{task_id}")
                rescue RestClient::ExceptionWithResponse => e
                # Show getTaskStatus errors
                output_response_error(e.response)
                raise
            else
                # Get the task status from response xml
                xml_data = REXML::Document.new(response)
                task_element = xml_data.elements["response/task"]
                task_status = task_element.attributes["status"]
            end
        end

        # Check if there were errors ..
        raise "The task hasn't been processed because an error occurred" if task_status == "ProcessingFailed"
        
        # .. or you don't have enough credits (see http://ocrsdk.com/documentation/specifications/task-statuses for other statuses)
        raise "You don't have enough money on your account to process the task" if task_status == "NotEnoughCredits"

        # Get the result download link
        download_url = xml_data.elements["response/task"].attributes["resultUrl"]

        # Download the result
        puts "Downloading result.."
        recognized_text = RestClient.get(download_url)
        recognized_text=recognized_text.to_s

        array=[]
        recognized_text.each_line{|c| array.push(c)}

        array.each do |s|
            s.gsub!(' ', '')
        end

        new_array=[]
        numbers=["0","1","2","3","4","5","6","7","8","9"]
        array.each do |element|
            for i in 0..element.length
                if numbers.include?(element[i])
                    item=element[0..(i-1)]
                    price=element[i..-1]
                    break
                end
            end
            new_array.push([item,price])
        end

        return new_array
    end


end


