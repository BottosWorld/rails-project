class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
	  @user = User.new(user_params(:first_name, :last_name, :email, :password_digest))
	  @user.save
	  redirect_to user_path(@user)
	end

	def update
	  @user = User.find(params[:id])
	  @user.update(user_params(:first_name, :last_name, :email, :password_digest))
	  redirect_to user_path(@user)
	end

	def edit
	  @user = User.find(params[:id])
	end

private
	def user_params(*args)
		params.require(:user).permit(*args)
	end
end