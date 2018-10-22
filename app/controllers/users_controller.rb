class UsersController < ApplicationController
    def index
        @users = User.all
    end
  
    def show
        @user=User.find(params[:id])

    end
  
    
    def new 
        @user = User.new
        @users = User.all.map{ |c| [c.first_name] }
    end 

    
    def create
        array = params[:user][:first_name]
        array.map!(&:to_i)
        array = array[1..-1]
  
       array.each do |first_name|
       user = User.create(
       first_name: first_name
       )
      end 
    end 

  
    def edit
    end


    def update
    end

    def delete
    end
end