class ArticlesController < ApplicationController
  before_action :find_article, except: [:new, :create, :index, :from_author]
  before_action :authenticate_user!, only: [:new ,:create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end
  
  def from_author
    @user = User.find(params[:user_id])
  end

  def show
    #@article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
    #@article = Article.find(params[:id])
  end
  
  def update
    #@article = Article.find(params[:id])
    @article.update(article_params)
    @article.save_categories
    redirect_to @article
  end

  def create
    @article = current_user.articles.create(article_params)
    @article.save_categories
    redirect_to @article
    #render json: @article
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end
  
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:titulo, :contenido, category_elements: [])
  end
end
