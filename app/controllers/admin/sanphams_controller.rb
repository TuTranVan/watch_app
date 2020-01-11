class Admin::SanphamsController < AdminController
  before_action :load_sanpham, only: %i(edit show update destroy)

  def index
    if params[:sanpham] && params[:sanpham][:loaisp_id]
      @sanphams = Sanpham.by_category params[:sanpham][:loaisp_id]
    else
      @sanphams = Sanpham.all
    end
    @sanphams = @sanphams.newest
  end

  def new
    @sanpham = Sanpham.new
  end

  def create
    @sanpham = Sanpham.new sanpham_params
    if @sanpham.save
      flash[:success] = "Thêm sản phẩm thành công!"
      redirect_to admin_sanphams_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @sanpham.update_attributes sanpham_params
      flash[:success] = "Sửa sản phẩm thành công!"
      redirect_to admin_sanpham_path(@sanpham)
    else
      render :edit
    end
  end

  def destroy
    if @sanpham.destroy
      flash[:success] = "Xóa sản phẩm thành công!"
    else
      flash[:danger] = "Xóa sản phẩm thất bại!"
    end
    redirect_to admin_sanphams_path
  end

  private

  def sanpham_params
    params.require(:sanpham).permit :masp, :maloai, :ten, :thuonghieu, :xuatsu,
      :mausac, :baohanh, :soluong, :dongia, :hinhanh
  end

  def load_sanpham
    @sanpham = Sanpham.find_by masp: params[:id]
    return if @sanpham
    flash[:danger] = "Không tìm thấy sản phẩm!"
    redirect_to admin_sanphams_path
  end
end
