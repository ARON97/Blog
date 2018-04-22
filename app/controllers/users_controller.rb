class UsersController < ApplicationController
	# define a new action
	def new
		# Instance variable. Links the controller to the template(new.html.erb)
		@user = User.new
	end

	# handling the sign up button
	def create
		@user = User.new(user_params) # user_params is a private method
		# determines if the user was successfully saved
		if @user.save
			# displaying the successful message and the username
			flash[:success] = "Welcome to the alpha blog #{@user.username}"
			redirect_to articles_path # redirect
		else 
			render 'new'
		end
	end

	# defining a private method
	private
	def user_params
		params.require(:user).permit(:username, :email, :password) # permitting these params
	end
end