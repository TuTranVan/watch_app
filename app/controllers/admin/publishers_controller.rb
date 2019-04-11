class Admin::PublishersController < AdminController
  before_action :load_publisher, only: %i(edit update destroy)

  def index
    @publishers = Publisher.alphabet.paginate page: params[:page], per_page: 5
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new publisher_params
    if @publisher.save
      flash[:success] = "Thêm nhà sản xuất thành công!"
      redirect_to admin_publishers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @publisher.update_attributes publisher_params
      flash[:success] = "Cập nhật nhà sản xuất thành công!"
      redirect_to admin_publishers_path
    else
      render :edit
    end
  end

  def destroy
    if @publisher.destroy
      flash[:success] = "Xóa thành công!"
    else
      flash[:danger] = "Xóa thất bại!"
    end
    redirect_to admin_publishers_path
  end

  private

  def publisher_params
    params.require(:publisher).permit :name, :phone, :address
  end

  def load_publisher
    @publisher = Publisher.find_by id: params[:id]
    return if @publisher
    flash[:danger] = "Không tìm thấy!"
    redirect_to admin_publishers_path
  end
end
