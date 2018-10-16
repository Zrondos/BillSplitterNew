
class BillsController < ApplicationController

  def index
    resource = OcrSpace::Resource.new(apikey: "29b24fb56e88957")
    result = resource.convert url: "https://expressexpense.com/images/sample-gas-receipt.jpg"
    puts result
    result = resource.clean_convert url: "https://expressexpense.com/images/sample-gas-receipt.jpg"
    puts result
  end

  def show
  end

  def edit
  end

  def delete
  end

  def create
  end

  def update
  end
end
