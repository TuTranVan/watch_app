class BinhluansController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :load_binhluan, only: :destroy

  def create
    @binhluan = current_user.binhluans.build binhluans_params
    if Binhluan.all.any?
      @binhluan.mabl = "BL#{Binhluan.last.mabl.last.to_i + 1}"
    else
      @binhluan.mabl = "BL1"
    end
    if @binhluan.save
      redirect_to @binhluan.sanpham
    else
      redirect_to @binhluan.sanpham
    end
  end

  def destroy
    if @binhluan.destroy
      redirect_to @binhluan.sanpham
    else
      redirect_to @binhluan.sanpham
    end
  end

  private

  def binhluans_params
    params.require(:binhluan).permit :masp, :noidung
  end

  def load_binhluan
    @binhluan = current_user.binhluans.find_by mabl: params[:id]
    return if @binhluan
    redirect_to root_path
  end
end
