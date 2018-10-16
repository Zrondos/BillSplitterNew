
class BillsController < ApplicationController

  def index
    @bills = Bill.all

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
