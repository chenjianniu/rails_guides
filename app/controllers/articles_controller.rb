class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "chen", password: "jian", except: [:index, :show]
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		byebug
		# render plain: params[:article].inspect
		# @article = Article.new(params.require(:article).permit(:title,:text))
		params.permit!
		@article = Article.new(params[:article])
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		byebug
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		params.permit!
		@article = Article.find(params[:id])
		byebug
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

end

private
	def article_params
		params.require(:article).permit(:title,:text)
		# params.permit!
	end