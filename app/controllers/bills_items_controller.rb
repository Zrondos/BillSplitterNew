
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
    item_id = params[:bills_item][:item_id]
    bill_ids= params[:bills_item][:bill_ids]   

    bill_ids.each do |id| 
      BillsItem.create(
        item_id: item_id,
        bill_id: id
    )
    end
    redirect_to bills_items_path
  end
  

  def update
  end

  def delete
  end
  
end
