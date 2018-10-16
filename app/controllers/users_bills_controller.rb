
class UsersBillsController < ApplicationController

  def index
  end

  def show
  end
 
  def new 
    @users_bill = UsersBill.new
  end 

  def create
    @users_bill = UsersBill.create(
      user_id: params[:users_bill][:user_id],
      bill_id: params[:users_bill][:bill_id],
    )
    redirect_to users_bills_path

  end

  def update
  end


  def edit
  end

  def delete
  end

  
end
