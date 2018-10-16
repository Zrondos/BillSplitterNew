
class BillsItemsController < ApplicationController

  def index
    @bills_item = BillsItem.all
  end 
  

  def show
  end

  def edit
  end

  def new 
    @bills_item = BillsItem.new 
  end 

  def create
    @bills_item = BillsItem.create(
      item_id: params[:bills_item][:item_id],
      bill_id: params[:bills_item][:bill_id],

    )
    # session[:bills_items_id] = bills_items_.id
    redirect_to bills_items_path
  end
  

  def update
  end

  def delete
  end
end
