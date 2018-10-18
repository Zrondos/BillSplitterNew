require "rest_client"

require "rexml/document"

class OcrskdCall
    def initialize(file_name)
        @file_name=file_name
    end

    def api_call
        APPLICATION_ID = CGI.escape("BillSplitterApp")
        PASSWORD = CGI.escape("Gc4wsceCBv8uDYh/TSEqjJkc")
        FILE_NAME = @file_name
        LANGUAGE = "English"
        BASE_URL = "http://#{APPLICATION_ID}:#{PASSWORD}@cloud.ocrsdk.com"

        # Routine for OCR SDK error output
        def output_response_error(response)
            # Parse response xml (see http://ocrsdk.com/documentation/specifications/status-codes)
            xml_data = REXML::Document.new(response)
            error_message = xml_data.elements["error/message"]
            puts "Error: #{error_message.text}" if error_message
        end

        # Upload and process the image (see http://ocrsdk.com/documentation/apireference/processImage)
        puts "Image will be recognized with #{LANGUAGE} language."
        puts "Uploading file.."
        begin
            response = RestClient.post("#{BASE_URL}/processImage?language=#{LANGUAGE}&exportFormat=txt", :upload => { 
                :file => File.new(FILE_NAME, 'rb') 
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
                response = RestClient.get("#{BASE_URL}/getTaskStatus?taskid=#{task_id}")
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
