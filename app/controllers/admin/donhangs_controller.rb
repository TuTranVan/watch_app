class Admin::DonhangsController < AdminController
  before_action :load_donhang, only: %i(show finish)
  skip_before_action :authorized?, only: :finish


  def index
    if params[:request] && params[:request][:status]
      @donhangs = Donhang.by_status params[:request][:status]
    else
      @donhangs = Donhang.all
    end
    @donhangs = @donhangs.order_status
  end

  def confirm
    @donhang = Donhang.find_by madh: params[:donhang][:id]
    @donhang.magh = params[:donhang][:magh]
    @donhang.shiping!
    @donhang.save
    flash[:success] = "Xử lí thành công!"
    redirect_to admin_donhang_path(@donhang)
  end

  def finish
    @donhang.finish!
    flash[:success] = "Xử lí thành công!"
    redirect_to admin_donhang_path(@donhang)
  end

  def show; end

  private

  def load_donhang
    @donhang = Donhang.find_by madh: params[:id]
    return if @donhang
    redirect_to admin_donhangs_path
  end
end
