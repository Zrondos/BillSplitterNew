class ProfilesController < ApplicationController
  def index
    @users = User.all
    @users_bill = UsersBill.all
  end

  def show
    @user = User.find(params[:id])
    @users_bill = UsersBill.find(params[:id])
    @users = User.all.map{ |c| [ c.id] }



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
