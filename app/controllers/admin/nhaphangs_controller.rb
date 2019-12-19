class Admin::NhaphangsController < AdminController
  before_action :load_nhaphang, only: %i(destroy)

  def index
    @nhaphangs = Nhaphang.newest
  end

  def create
    @nhaphang = current_user.nhaphangs.build nhaphang_params
    if @nhaphang.save
      flash[:success] = "Cập nhật thành công"
      sanpham = @nhaphang.sanpham
      sanpham.soluong += @nhaphang.soluong
      sanpham.save
    else
      flash[:danger] = "Cập nhật thất bại"
    end
    redirect_to admin_sanpham_path @nhaphang.sanpham
  end

  def destroy
    if @nhaphang.destroy
      flash[:success] = "Xóa thành công!"
      sanpham = @nhaphang.sanpham
      sanpham.soluong -= @nhaphang.soluong
      sanpham.save
    else
      flash[:danger] = "Xóa thất bại!"
    end
    redirect_to admin_nhaphangs_path
  end

  private

  def nhaphang_params
    params.require(:nhaphang).permit :sanpham_id, :soluong
  end

  def load_nhaphang
    @nhaphang = Nhaphang.find_by id: params[:id]
    return if @nhaphang
    redirect_to admin_nhaphangs_path
  end
end
