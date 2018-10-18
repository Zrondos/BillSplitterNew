
class BillsController < ApplicationController

  def index
    @bills = Bill.all
    @users = User.all

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
