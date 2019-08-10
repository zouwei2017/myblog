class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action only: [:destroy] do
    authorize_resource! comment
  end

  def create
    @article = Article.find_by_id(params[:article_id])
    @comment = Comment.new(comments_params)
    @comment.user_id = 1
    @comment.article_id = @article.id
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find_by_id(params[:article_id])
    @comment = @article.comments.find_by_id(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end


  private

  def comments_params
    params.require(:comment).permit(:commenter, :body,)
  end

  def comment
    @comment = Comment.find(params[:id])
  end
end
