class ProfilesController < ApplicationController
  def index
    @users = User.all
    @users_bill = UsersBill.all
  end

  def show
    @bill=Bill.find(params[:id])
    @user = User.find(params[:id])
    @users_bill = UsersBill.find(params[:id])
    @users = User.all.map{ |c| [ c.id] }
    @group_bill = @bill.group_bill
  end

  def edit
  end

  def delete
  end

  def create
  end

  def update
  end
end
