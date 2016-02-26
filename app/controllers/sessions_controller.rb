class SessionsController < ApplicationController
	
	def new
		@user = User.new
		render :new
	end

	def create
		user_params = params.require(:user).permit(:username, :password)
		#this creates the session, logging in the user
		@user = User.confirm(user_params)
		if @user
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			redirect_to login_path,
			:flash => { :error => "Incorrect USERNAME or PASSWORD, try again case sensitive"  }
		end
	end

	def destroy
		session.delete(:user_id)
    redirect_to "/"
  end

end
