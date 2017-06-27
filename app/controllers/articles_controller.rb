class ArticlesController < ApplicationController
	include ArticlesHelper
	
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end
	
	def create
		@article = Article.new(article_params)
		
		if @article.save
			flash.notice = "Article '#{@article.title}' is created!"
			redirect_to article_path(@article)
		else 
			redirect_to new_article_path
		end

	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
	
		flash.notice = "Article '#{@article.title}' is deleted!"
	
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' is updated!"

		redirect_to article_path(@article)
	end
end
