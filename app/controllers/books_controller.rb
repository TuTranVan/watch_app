class BooksController < ApplicationController
  before_action :load_book, only: :show

  def index
    @sanphams = Sanpham.newest
    if params[:search] && params[:search][:key]
      @sanphams = @sanphams.where('ten LIKE ? OR thuonghieu LIKE ?', "%#{params[:search][:key]}%", "%#{params[:search][:key]}%")
    end
  end

  def show; end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    redirect_to root_path
  end
end
