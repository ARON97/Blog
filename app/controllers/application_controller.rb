class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception
	# For APIs, you may want to use :null_exception instead of :exception
  	protect_from_forgery with: :exception

  	# The methods created here are available throughout all of the controllers.
  	# They are not available to the views, by default

  	# Making current_user and logged_in? available to the views
  	helper_method :current_user, :logged_in?

  	# check if the user is logged in
  	def current_user
  		# return the user if there is a user_id stored in session hash, if so then find
  		# the user in the database based on that user id
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  		# if the current user already exits. @current_user ||= this is called memorization
  		# return currrent user if current user already exists
  	end

  	# check if there is a current user logged in
  	def logged_in?
  		# to convert to a boolean use !!
  		!!current_user # returns true if there is a current user and false if there is no current user
  	end

  	# certain actions to restrict based on if there is a logged in user or not
  	def require_user
  		# not logged in
  		if !logged_in?
  			flash[:danger] = "You must be logged in to perform that action"
  			redirect_to root_path
  		end
  		# if they logged in this action will not execute
  	end
end
