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
  end

  def edit
    #@article = Article.find(params[:id])
  end
  
  def update
    #@article = Article.find(params[:id])
    @article.update(titulo: params[:article][:titulo], contenido: params[:article][:contenido])
    redirect_to @article
  end

  def create
    @article = current_user.articles.create(titulo: params[:article][:titulo], contenido: params[:article][:contenido])
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
  
    
end
