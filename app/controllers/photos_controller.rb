class PhotosController < ApplicationController
  def index
    # creating group_bill 
    @users = User.all.map{ |c| [ c.id] }
    @group_bill = GroupBill.new 

    # creating items
    @item = Item.new 


    @bill = Bill.all
    @items = Item.all.map { |c| [ c.name, c.id] }
    @bills_item = BillsItem.new
  end


  


  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
