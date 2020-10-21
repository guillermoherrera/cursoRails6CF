class ArticlesController < ApplicationController
  before_action :find_article, except: [:new, :create, :index]

  def index
    @articles = Article.all
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
    @article = Article.create(titulo: params[:article][:titulo], contenido: params[:article][:contenido])
    render json: @article
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
