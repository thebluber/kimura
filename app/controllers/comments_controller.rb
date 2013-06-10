class CommentsController < ApplicationController
  before_filter :signed_in?
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to @comment.kimura
    end
  end
  def destroy

    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.kimura
  end
end
