
class BillsItemsController < ApplicationController

  def index
    @bills_item = BillsItem.all
  end 


  def show
  end

  def edit
  end

  def new 
    @bill = Bill.all
    @items = Item.all
    @items = Item.all.map { |c| [ c.name, c.id] }
    @bills_item = BillsItem.new
  end 

  def create
    respond_to do |format|
      format.js 
    end
    # redirect_to group_bill_path(@group_bill)
  end
  

  def update
  end

  def delete
  end
  
end
