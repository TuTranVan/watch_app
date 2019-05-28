class LikesController < ApplicationController
  before_action :load_like, only: :destroy

  def create
    @like = current_user.likes.build likes_params
    if @like.save
      flash[:success] = "Bạn đã yêu thích cuốn sách này!"
    else
      flash[:danger] = "Lỗi"
    end
    redirect_to @like.book
  end

  def destroy
    if @like.destroy
      flash[:success] = "Bạn đã bỏ yêu thích sách này!"
    else
      flash[:danger] = "Lỗi"
    end
    redirect_to @like.book
  end

  private

  def likes_params
    params.require(:like).permit :book_id
  end

  def load_like
    @like = current_user.likes.find_by book_id: params[:book_id]
    return if @like
    redirect_to root_path
  end
end
