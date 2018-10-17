
class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
  end


  def new 
    @item = Item.new 
  end 

  def create
    @item = Item.create(
      name: params[:item][:name],
      price: params[:item][:price],
      group_bill_id: params[:item][:group_bill_id],

    )
    # session[:group_bill_id] = group_bill.id
    redirect_to items_path
  end


  def edit
  end

  def delete
  end

  

  def update
  end
end
