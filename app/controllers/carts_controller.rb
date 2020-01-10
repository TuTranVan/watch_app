class CartsController < ApplicationController
  before_action :load_sanpham, only: [:add_to_cart, :remove_cart]
  def index; end

  def add_to_cart
    if check_in?(@sanpham)
      if @sanpham.soluong == 0
        flash[:danger] = "Sản phẩm hiện đang hết!"
      else
        cart << { masp: @sanpham.masp, sl: 1 }
      end
    end
    redirect_to carts_path
  end

  def update_cart
    cart.each { |item|
      item["sl"] = params[:cart][:sl].to_i if item["masp"] == params[:cart][:masp]
    }
    flash[:success] = "Cập nhật thành công!"
    redirect_to carts_path
  end

  def remove_cart
    cart.delete_if { |x| x["masp"] == @sanpham.masp }
    redirect_to carts_path
  end

  def empty_cart
    cart.clear
    redirect_to carts_path
  end

  private

  def load_sanpham
    @sanpham = Sanpham.find_by masp: params[:id]
    return if @sanpham
    redirect_to root_path
  end
end
