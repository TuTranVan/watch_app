class BooksController < ApplicationController
  before_action :load_book, only: :show

  def index
    @books = Book.newest
    if params[:search] && params[:search][:key]
      @books = @books.where('name LIKE ? OR author LIKE ?', "%#{params[:search][:key]}%", "%#{params[:search][:key]}%")
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
