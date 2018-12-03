require "rest_client"

require "rexml/document"

class GroupBillsController < ApplicationController

  def show
    @group_bill = GroupBill.find(params[:id])
    @bill = Bill.new

    @items = @group_bill.items
    @admin= User.find(@group_bill.admin_id)
    @bills_items=BillsItem.new
    @bills_on_group_bill=@group_bill.bills
    @users=User.all.map { |c| [ c.first_name.capitalize, c.id] }
    all_users=User.all
    users_to_add=[]
    all_users.each do |user|
        list_of_bills=[]
        user.bills.each do |bill|
            list_of_bills.push(bill.group_bill_id)
        end
        if list_of_bills.include?(@group_bill.id)
            next
        else
            users_to_add.push(user)
        end
    end
   
    @users_to_add = users_to_add.map { |c| [ c.first_name.capitalize, c.id] }

  end

  def new
    @group_bill=GroupBill.new
  end

  def create
    
    @group_bill = GroupBill.create(
      name: params[:group_bill][:name],  
      admin_id: params[:group_bill][:admin_id],
      receipt: params[:group_bill][:receipt],
      subtotal: 0,
      tax: 0,
      tip: 0,
      total: 0
    )
    @subtotal=0
    @tax=0
    items_array=api_call(@group_bill)
    items_array.each do |item|
        if item[0]=='Subtotal'
             next
        elsif item[0]=='Tax'
            @tax=item[1].to_f
             next
        elsif item[0]=='Total'
             next
        end
        @subtotal+=item[1].to_f

    end

    @tip=(@tax+@subtotal)*0.2

    group_bill_id=@group_bill.id
    
    @group_bill=GroupBill.find(@group_bill.id).update(
        name: params[:group_bill][:name],  
        admin_id: params[:group_bill][:admin_id],
        receipt: params[:group_bill][:receipt],
        subtotal: @subtotal,
        tax: @tax,
        tip: @tip,
        total: (@subtotal+@tax+@tip)
        )

    
    items_array.each do |item|
        
        if item[0].downcase=='Subtotal' || item[0].downcase=='sub-total' || item[0].downcase=='sub total'
            next
        elsif item[0].downcase=='tax'
            next
        elsif item[0].downcase=='total' || item[0].downcase=='balance due'
            next
        end
      Item.create(
        name: item[0],
        price: item[1],
        group_bill_id: group_bill_id
      )
    end
    redirect_to group_bill_path(group_bill_id)
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
            s.gsub!(' ','')
        end

 

        item_price_pairs=[]
        numbers=["0","1","2","3","4","5","6","7","8","9","."," "]
        first_item=true
        array.each do |string|
            item_info=""
            price=""
            string_indicies=(0...string.length).to_a
            string_indicies.reverse_each do |index|
                if numbers.include?(string[index-2])
                    next
                end
                item_info=string[0..index-2]
                price=string[index-1..-1]
                break
            end
            quantity=""
            item_name=""
            index_of_last_digit=-1
            for i in (0...item_info.length).to_a
                if  not numbers.include?(item_info[i])
                    item_name=item_info[(index_of_last_digit+1)..-1]
                    break
                end
                quantity+=item_info[i]
                index_of_last_digit=i
            end
            item_capitalized=""
            for index in (0...item_name.length).to_a
                to_add=item_name[index]
                if item_name[index]==item_name[index].upcase && index!=0
                    to_add=" "+item_name[index]
                end
                item_capitalized+=to_add
            end

            quantity.gsub!(' ', '')
            quantity=quantity.to_i
            if quantity==0
                quantity=1
            end
            price=price.to_f
            price_per=price/quantity


            if first_item
                item_capitalized=item_capitalized[5..-1]
                first_item=false
            end
            for i in 0...quantity
                item_price_pairs.push([item_capitalized,price_per])
            end
        end

        return item_price_pairs
        
    end

end


