
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
      file_name: params[:group_bill][:file_name]
    )
    # session[:group_bill_id] = group_bill.id
    calll=OcrskdCall.new(file_name)
    items_array=call.api_call
    items_array.each do |item|
      Item.create(
        name: item[0]
        price: item[1]
        group_bill_id: @group_bill.id
      )
    end
    redirect_to group_bills_path

  end

  def update
  end

  def delete
  end
end


