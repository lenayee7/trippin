class UsersController < ApplicationController

	def index
		@users = User.all
		render :index
	end

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.create(user_params)
		login(@user)
		redirect_to @user
	end

 	def show
		@user = User.find(params[:id])
		# @trip = Trip.new
		# @trip = current_user.trips.find(params[:id])
		render :show
	end

	def edit 
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update_attributes(user_params)
		flash[:success] = "Profile updated"
		redirect_to user
	end

	def destroy
    user = User.find(params[:id])
    logout
    user.destroy
    redirect_to "/", :notice => "DELETED, Sign Up again"
	end

private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :password)
	end

end
