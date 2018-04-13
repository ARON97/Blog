class ArticlesController < ApplicationController

	# The index action. In this case it will be Articles where all the articles are listed
	def index
		@articles = Article.all # grab all articles in db
	end

	# Adding articles route
	def new
		@article = Article.new # initiate the instance variable
	end

	def edit
		@article = Article.find(params[:id]) # find the article
	end

	# defining action create. The button
	def create
		# To save
		@article = Article.new(article_params)

		# if the information passed does not meet validations
		if @article.save
			flash[:notice] = "Article was successfully created" # successful message
			redirect_to article_path(@article)
		else
			# if validations was unsuccessful
			render 'new'
		end
		
	end

	# update action
	def update
		@article = Article.find(params[:id])
		# if edited information does not meet validations
		if @article.update(article_params)
			flash[:notice] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	# showing the created article
	def show
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.require(:article).permit(:title, :description)
	end

	# define show action

end