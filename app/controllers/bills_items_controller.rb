
class BillsItemsController < ApplicationController

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
  
end
