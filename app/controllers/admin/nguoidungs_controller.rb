class Admin::NguoidungsController < AdminController
  before_action :load_user, only: %i(edit update destroy)

  def index
    if params[:user] && params[:user][:role]
      @users = Nguoidung.by_role params[:user][:role]
    else
      @users = Nguoidung.all
    end
  end

  def new
    @user = Nguoidung.new
  end

  def create
    @user = Nguoidung.new user_params
    @user.mand = "ND#{Nguoidung.last.mand.last.to_i + 1}"
    if @user.save
      flash[:success] = "Thêm người dùng thành công!"
      redirect_to admin_nguoidungs_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Sửa người dùng thành công!"
      redirect_to admin_nguoidungs_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "Xóa người dùng thành công!"
    else
      flash[:danger] = "Xóa người dùng thất bại!"
    end
    redirect_to admin_nguoidungs_path
  end

  private

  def user_params
    params.require(:nguoidung).permit :ten, :email, :sdt, :diachi,
      :password, :password_confirmation, :role
  end

  def load_user
    @user = Nguoidung.find_by mand: params[:id]
    return if @user
    flash[:danger] = "Không tìm thấy!"
    redirect_to admin_nguoidungs_path
  end
end
