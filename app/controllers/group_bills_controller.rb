
class GroupBillsController < ApplicationController

  def index
    @group_bills = GroupBill.all
  end

  def show
  end

  def edit
  end

  

  def new 
    @group_bill = GroupBill.new 
  end 



  def create
    @group_bill = GroupBill.create(
      admin: params[:group_bill][:admin],
    )
    # session[:group_bill_id] = group_bill.id
    redirect_to group_bills_path
  end

  def update
  end

  def delete
  end
end


