class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.create(titulo: params[:article][:titulo], contenido: params[:article][:contenido])
    render json: @article
  end
    
end
