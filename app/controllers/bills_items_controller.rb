
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
    result=params[:bills_item][:test]
    
    result=result.split("/")
    result.each do |array|
      array=array.split(",")
      bill=array[0][4..-1].to_i
      item=array[1][4..-1].to_i
      BillsItem.create(
      item_id: item,
      bill_id: bill
        )
    end
    
  end

  

  def update

    
  end

  def delete
  end
  
end
