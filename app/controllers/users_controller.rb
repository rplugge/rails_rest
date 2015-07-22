class UsersController < ApplicationController
  
  # get "users"
  def index
    @users = User.all
  end
  
  # get "users/new"
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
  
  def update
    
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
  
    @user.save
  
    redirect_to "users/#{@user.id}"
  end
  
  def delete
    @user = User.find(params["id"])
    @user.delete
    
    redirect_to "/users"
  end
end
