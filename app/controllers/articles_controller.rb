class ArticlesController < ApplicationController

	# Adding articles routes
	def new
		@article = Article.new # initiate the instance variable
	end

	# defining action create. The button
	def create
		# display what is passed in
		# render plain: params[:article].inspect
		# To save
		@article = Article.new(article_params)
		@article.save
		redirect_to articles_show(@article) # redirect to articles_show
	end

	private
	def article_params
		params.require(:article).permit(:title, :description)
	end

end