
class BillsController < ApplicationController

  def index
<<<<<<< HEAD
    resource = OcrSpace::Resource.new(apikey: "29b24fb56e88957")
    result = resource.convert url: "https://expressexpense.com/images/sample-gas-receipt.jpg"
    puts result
    result = resource.clean_convert url: "https://expressexpense.com/images/sample-gas-receipt.jpg"
    puts result
=======
    @bills = Bill.all

>>>>>>> c69565c5243616700c2fcaed47344330cb9075d5
  end

  def show
  end



  def new 
    @bill = Bill.new 
  end 

  def create
    @bill = Bill.create(
      group_bill_id: params[:bill][:group_bill_id]
    )
    # session[:bill_id] = bill.id
    redirect_to bills_path
  end


  def update
  end



  def edit
  end

  def delete
  end
end
