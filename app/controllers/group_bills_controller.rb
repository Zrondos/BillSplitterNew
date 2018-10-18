
class GroupBillsController < ApplicationController

  def index
    @group_bills = GroupBill.all
  end

  def show
  end

  def new
    @group_bill=GroupBill.new
  end

  def edit
  end

  

  def new 
    @group_bill = GroupBill.new 
  end 



  def create
    @group_bill = GroupBill.create(
      admin: params[:group_bill][:admin],
      file_name: params[:group_bill][:file_name]
    )
    # session[:group_bill_id] = group_bill.id
    calll=OcrskdCall.new(file_name)
    items_array=call.api_call
    items_array.each do |item|
      Item.create(
        name: item[0]
        price: item[1]
        
      )
    redirect_to group_bills_path
  end

  def update
  end

  def delete
  end
end


