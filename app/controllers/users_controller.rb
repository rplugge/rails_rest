class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
  end
  
  def create
    user_password = BCrypt::Password.create(params[:password])
    
    @user = User.create({name: params[:name], email: params[:email], password: user_password})
    
    redirect_to "users/#{@user.id}"

  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def delete
    binding.pry
    @user = User.find(params["id"])
    @user.delete
    
    redirect_to "/users/index"
  end
end
