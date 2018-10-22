
class BillsItemsController < ApplicationController

  def create
    result=params[:bills_item][:list_of_bills_items]
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
    group_bill_id=params[:bills_item][:group_bill_id].to_i
    admin_id=params[:bills_item][:admin_id]
    user=User.find(admin_id)

    users_bills=User.find(admin_id).bills
    
    users_bills.each do |bill|
      if bill.group_bill_id==group_bill_id
        redirect_to bill_path(bill.id)
      end
    end
    
  end
  
end
