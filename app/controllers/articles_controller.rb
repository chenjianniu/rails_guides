class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "chen", password: "jian", except: [:index, :show]
	layout Proc.new{|controller|controller.test_method}
	def index
		@articles = Article.all
		@articles_new = Article.all
		# DataLockView.create(:name=>"物管_01",:name_a=>"物管_01_a",:name_b=>"物管_01_b")
		# DataLockView.create(:name=>"物管_02",:name_a=>"物管_02_a",:name_b=>"物管_02_b")
		# DataLockView.create(:name=>"物管_03",:name_a=>"物管_03_a",:name_b=>"物管_03_b")
		# DataLockView.create(:name=>"物管_04",:name_a=>"物管_04_a",:name_b=>"物管_04_b")
		# DataLockView.create(:name=>"物管_05",:name_a=>"物管_05_a",:name_b=>"物管_05_b")
		#Comment.create(:commenter=>"4-ceshi",:body=>"4-ceshi",:article_id=>1)
		#Article.create(:title=>"111111",:text=>"222222231")
		#Article.create(:title=>"001",:text=>"000002")
		# Article.joins("inner join comments on comments.article_id = articles.id")
		# article = Article.includes(:comments).limit(10)
		# article.each{|data|puts data.comments}
		#render inline: "<% @articles.each do |p| %><p><%= p.title %></p><% end %>"
		#render inline: "xml.p {'Horrid coding practice!'}", type: :builder
		#render html: "<h1>你好老大</h1><h2>你好老二</h2>".html_safe
		#render json: @articles
		#render js: "alert('Hello Rails');"
		#render status: :im_used
		# render formats: :json
		# head :ok
	end

	def test_method
		"application"
	end

	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect
		# @article = Article.new(params.require(:article).permit(:title,:text))
		params.permit!
		@article = Article.new(params[:article])
		Article.first
		#validates_confirmation_of
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		params.permit!
		@article = Article.find(params[:id])
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