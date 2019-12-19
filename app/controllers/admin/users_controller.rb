class Admin::UsersController < AdminController
  before_action :load_user, only: %i(edit update destroy)

  def index
    if params[:user] && params[:user][:role]
      @users = User.by_role params[:user][:role]
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Thêm người dùng thành công!"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Sửa người dùng thành công!"
      redirect_to admin_users_path
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
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :ten, :email, :sdt, :diachi,
      :password, :password_confirmation, :role
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = "Không tìm thấy!"
    redirect_to admin_users_path
  end
end
