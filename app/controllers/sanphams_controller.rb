class SanphamsController < ApplicationController
  before_action :load_sanpham, only: :show

  def index
    @sanphams = Sanpham.newest
    if params[:search] && params[:search][:key]
      @sanphams = @sanphams.where('ten LIKE ? OR thuonghieu LIKE ?', "%#{params[:search][:key]}%", "%#{params[:search][:key]}%")
    end
  end

  def show; end

  private

  def load_sanpham
    @sanpham = Sanpham.find_by id: params[:id]
    return if @sanpham
    redirect_to root_path
  end
end
