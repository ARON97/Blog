class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy] # ensures that other methods call the set_article method first
	# means that only this methods will impliment set_article

	# ensures that there is a logged in user when editing, updating and destroying. Except for index and show
	before_action :require_user, except: [:index, :show]

	# ensures that the user can only edit, update and destroy their articles
	before_action :require_same_user, only: [:edit, :update, :destroy]

	# The index action. In this case it will be Articles where all the articles are listed
	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	# Adding articles route
	def new
		@article = Article.new # initiate the instance variable
	end

	def edit
		 # find the article
	end

	# defining action create. The button
	def create
		# debugger
		# To save
		@article = Article.new(article_params)
		@article.user = current_user # create an article for the current user
		# if the information passed does not meet validations
		if @article.save
			# Success will display green. Replaced noticed
			flash[:success] = "Article was successfully created" # successful message
			redirect_to article_path(@article)
		else
			# if validations was unsuccessful
			render 'new'
		end
		
	end

	# update action
	def update
		# if edited information does not meet validations
		if @article.update(article_params)
			# Success will display green. Replaced noticed
			flash[:success] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	# showing the created article
	def show
		
	end

	# destroy action
	def destroy
		# find the article
		
		# delete article
		@article.destroy
		# send a message. danger will display the message in red
		flash[:danger] = "Article was successfully deleted"
		# redirect to article paths
		redirect_to articles_path
	end

	private
		# method to avoid repetition. Find articles
		def set_article
			@article = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :description)
		end

		def require_same_user
			# if the logged in user has not created this article
			if current_user != @article.user and !current_user.admin?
				 # checks and ensures that not only is the current user not the article creator but also if the current_user is an admin
				flash[:danger] = "You can only edit or delete your own article"
				redirect_to root_path
			end
		end

end