class PagesController < ApplicationController

	# building the home action
	def home
		# when the user is logged in redirect to articles path
		redirect_to articles_path if logged_in?
	end

	# building the about action
	def about
		
	end
end