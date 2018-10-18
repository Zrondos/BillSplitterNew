
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
    @items = @group_bill.items.map{ |c| [ c.name, c.id]}
    @bills_item = BillsItem.new
    
    # bills-items functionality 
    @items = Item.all
    @items = Item.all.map { |c| [ c.name, c.id] }
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
    )
    # session[:group_bill_id] = group_bill.id
    redirect_to group_bill_path(@group_bill)
  end

  def update
  end

  def delete
  end
end


