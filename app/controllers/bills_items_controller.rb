
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
    items = params[:bills_item][:items_ids]
    items = items[1..-1]
    items.each do |item| 
      
    BillsItem.create(
      item_id: item,
      bill_id: params[:bills_item][:bill_id]
    )
    end 

    redirect_to bills_items_path
  end
  

  def update
  end

  def delete
  end
end
