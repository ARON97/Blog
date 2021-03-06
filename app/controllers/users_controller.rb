class UsersController < ApplicationController

	# getting rid of redundent code
	before_action :set_user, only: [:edit, :update, :show]

	# require the same user to edit, update and delete their profile
	before_action :require_same_user, only: [:edit, :update, :destroy]

	# restrict the destroy only to admins
	before_action :require_admin, only: [:destroy]

	def index
		# Adding pagination
		@users = User.paginate(page: params[:page], per_page: 5)
	end

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
			# Sign in user upon Signup
			session[:user_id] = @user.id
			# displaying the successful message and the username
			flash[:success] = "Welcome to the alpha blog #{@user.username}"
			redirect_to user_path(@user) # redirect upon signing up the user
		else 
			render 'new'
		end
	end

	# edit route
	def edit
		# edit is going to have the users id
		# @user = User.find(params[:id]) replaced by before_action
	end

	# edit action is going to be handled by the update action
	def update
		# @user = User.find(params[:id]) replaced by before_action
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to articles_path
		else
			render 'edit'	
		end
	end

	def show
		# finding the user based on the id
		# @user = User.find(params[:id]) replaced by before_action
		# to paginate the users articles
		@user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
	end

	# delete the user. To delete their articles modify the User model models\user.rb
	def destroy
		# find the user
		@user = User.find(params[:id])
		# delete the user
		@user.destroy
		flash[:danger] = "User and all articles created by user have been deleted"
		redirect_to users_path
	end
	# defining a private method
	private
	# whitelists username, email and password
	def user_params
		params.require(:user).permit(:username, :email, :password) # permitting these params
	end
	# the before_action method
	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		# The user can only edit their own account and when the current user is not the admin
		if current_user != @user and !current_user.admin?
			flash[:danger] = "You can only edit your own account"
			redirect_to root_path
		end
	end

	def require_admin
		# if the user is logged in and the user is not admin
		if logged_in? and !current_user.admin?
			flash[:danger] = "Only admin users can perform tha action"
			redirect_to root_path
		end
	end
end