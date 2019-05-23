class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :load_comment, only: :destroy

  def create
    @comment = current_user.comments.build comments_params
    if @comment.save
      redirect_to @comment.book
    else
      redirect_to @comment.book
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @comment.book
    else
      redirect_to @comment.book
    end
  end

  private

  def comments_params
    params.require(:comment).permit :book_id, :content
  end

  def load_comment
    @comment = current_user.comments.find_by id: params[:comment_id]
    return if @comment
    redirect_to root_path
  end
end
