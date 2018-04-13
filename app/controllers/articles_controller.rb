class ArticlesController < ApplicationController

	# Adding articles routes
	def new
		@article = Article.new # initiate the instance variable
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