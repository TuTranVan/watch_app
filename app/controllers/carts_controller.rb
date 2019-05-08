class CartsController < ApplicationController
  before_action :load_book, only: [:add_to_cart, :remove_cart]
  def index
  end

  def add_to_cart
    if check_in?(@book)
      cart << @book
    end
    redirect_to carts_path
  end

  def remove_cart

  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    redirect_to root_path
  end
end
