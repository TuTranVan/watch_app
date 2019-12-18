class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  before_action :logged_in_user, only: %i(show edit update)
  before_action :correct_user, only: %i(show edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Đăng ký thành công!!"
      log_in @user
      redirect_to root_path
    else
      flash[:danger] = "Đăng ký thất bại!!"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Cập nhật thành công!"
      redirect_to current_user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :ten, :email, :sdt, :diachi,
      :password, :password_confirmation, :role
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = "controller.user.load_fail"
    redirect_to login_path
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if current_user?(@user)
    flash[:danger] = "controller.user.incorrect"
    redirect_to current_user
  end
end
