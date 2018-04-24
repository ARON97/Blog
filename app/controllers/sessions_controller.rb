class SessionsController < ApplicationController

	# renders a form
	def new
		
	end

	# handles the form submission. Starts the session and displays the user in a logged in state
	def create
		# find the user based on the email
		user = User.find_by(email: params[:session][:email].downcase) # all our emails in our database is downcased
		# check if the email is valid
		if user && user.authenticate(params[:session][:password])
			# simulate logging in
			session[:user_id] = user.id # saving the user id in the session. The browsers cookies is going to handle this
			# saving the users id in the session hash which is backed by the browser
			# display a message
			flash[:success] = "You have successfully logged in"
			redirect_to user_path(user)
		else
			# give a message since it is not a model back form
			flash.now[:danger] = "There was something wrong with your login information"
			# flash.new persists for one http request. When we redirect the message will display in the next screen
			# render the new template to login
			render 'new'
		end
	end

	# handles the logout. Stops the session and moves the user to logout state
	def destroy
		# setting the session to nil
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end