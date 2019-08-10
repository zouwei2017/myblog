class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    authorize_resource! article
  end

  def index
    @articles = Article.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    @article  = Article.find(params[:id])
    @article.update(article_params)
  end

  def show
    @article = Article.find(params[:id])
    @article
  end

  def destroy
    @article  = Article.find(params[:id])
    @article.destroy
    @articles = Article.all
    render 'index'
  end

  def create
    @article  = Article.new(article_params)
    @article.user_id = 1
    @article.author = 'peleus'
    @article.save
    @articles = Article.all
    render 'index'
  end

  def new
    @article = Article.new
  end

  def edit
    @article  = Article.find_by_id(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def article
    @article = Article.find(params[:id])
  end
end
