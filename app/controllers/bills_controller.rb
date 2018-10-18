
class BillsController < ApplicationController

  def index
    @bills = Bill.all
    @users = User.all

    resource = OcrSpace::Resource.new(apikey: "29b24fb56e88957")
    result = resource.convert url: "http://www.fakereceipt.us/images/218x320.gif"
    puts result
    result = resource.clean_convert url: "http://www.fakereceipt.us/images/218x320.gif"
    puts result

  end

  def show
    @bill=Bill.find(params[:id])
  end



  def new 
    @bill = Bill.new 
  end 

  def create
    users=params[:bill][:users_ids]
    users.each do |user|
        @bill = Bill.create(
          group_bill_id: params[:bill][:group_bill_id]
        )
        @users_bill=UsersBill.create(
          user_id: user,
          bill_id: @bill.id
        )
    end
    redirect_to bills_path
  end


  def update
  end



  def edit
  end

  def delete
  end
end
