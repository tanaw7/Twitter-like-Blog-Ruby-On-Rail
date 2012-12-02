class UsersController < ApplicationController
  def index
      @posts = User.find(params[:id]).posts
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to root_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
  end

  def profile
    if (current_user)
      @user = User.find(current_user) 
    end
  end

  def others_profile
    @other = User.find(params[:id])
  end
  
end
