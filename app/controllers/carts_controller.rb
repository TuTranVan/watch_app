class CartsController < ApplicationController
  before_action :load_sanpham, only: [:add_to_cart, :remove_cart]
  def index; end

  def add_to_cart
    if check_in?(@sanpham)
      if @sanpham.soluong == 0
        flash[:danger] = "Sản phẩm hiện đang hết!"
      else
        cart << @sanpham.id
      end
    end
    redirect_to carts_path
  end

  def remove_cart
    cart.delete_if { |x| x == @sanpham.id }
    redirect_to carts_path
  end

  def empty_cart
    cart.clear
    redirect_to carts_path
  end

  private

  def load_sanpham
    @sanpham = Sanpham.find_by id: params[:id]
    return if @sanpham
    redirect_to root_path
  end
end
