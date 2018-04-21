class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @commentable = @commentable.comments.new(comment_params)
    if @commentable.save
      redirect_to :back, notice: 'Your comments are posted'
    else
      redirect_to :back, notice: 'Your comments could not posted'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Story.find_by_id(params[:story_id]) if params[:story_id]
  end
end
