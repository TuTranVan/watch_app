class Admin::LoaispsController < AdminController
  before_action :load_loaisp, only: %i(edit update destroy)

  def index
    @loaisps = Loaisp.paginate page: params[:page],
      per_page: 5
  end

  def new
    @loaisp = Loaisp.new
  end

  def create
    @loaisp = Loaisp.new loaisp_params
    if @loaisp.save
      flash[:success] = "Thêm loại sản phẩm thành công!"
      redirect_to admin_loaisps_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @loaisp.update_attributes loaisp_params
      flash[:success] = "Cập nhật loại sản phẩm thành công!"
      redirect_to admin_loaisps_path
    else
      render :edit
    end
  end

  def destroy
    if @loaisp.destroy
      flash[:success] = "Xóa loại sách thành công!"
    else
      flash[:danger] = "Xóa loại sách thất bại!"
    end
    redirect_to admin_loaisps_path
  end

  private

  def loaisp_params
    params.require(:loaisp).permit :ten
  end

  def load_loaisp
    @loaisp = Loaisp.find_by id: params[:id]
    return if @loaisp
    redirect_to admin_loaisps_path
  end
end
