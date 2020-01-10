class DonhangsController < ApplicationController
  before_action :load_donhang, only: %i(show)

  def create
    @donhang = current_user.donhangs.build
    @donhang.ngaydat = Date.current
    @donhang.tongtien = cart_total
    @donhang.diachinhan = params[:donhang][:diachinhan] == "true" ? true : false
    if Donhang.all.any?
      @donhang.madh = "DH#{Donhang.last.madh.last.to_i + 1}"
    else
      @donhang.madh = "DH"
    end
    @donhang.save
    if @donhang.diachinhan?
      @nguoinhan = Nguoinhan.new
      @nguoinhan.madh = @donhang.madh
      @nguoinhan.hoten = params[:donhang][:hoten]
      @nguoinhan.diachi = params[:donhang][:diachi]
      @nguoinhan.sdt = params[:donhang][:sdt]
      if Nguoinhan.all.any?
        @nguoinhan.mann = "NN#{Nguoinhan.last.mann.last.to_i + 1}"
      else
        @nguoinhan.mann = "NN"
      end
      @nguoinhan.save
    end
    cart_shop.each do |item|
      sanpham = item[:sp]
      chitiet = @donhang.chitietdhs.build masp: sanpham.masp
      chitiet.soluong = item[:sl]
      chitiet.dongia = sanpham.dongia
      chitiet.save
      sanpham.soluong -= item[:sl]
      sanpham.save
    end
    cart.clear
    flash[:success] = "Đặt hàng thành công!"
    redirect_to current_user
  end

  def show; end

  private

  def load_donhang
    @donhang = Donhang.find_by madh: params[:id]
    return if @donhang
    redirect_to current_user
  end
end
