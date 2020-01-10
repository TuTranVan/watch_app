class NguoidungsController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  before_action :logged_in_user, only: %i(show edit update)
  before_action :correct_user, only: %i(show edit update)

  def new
    @user = Nguoidung.new
  end

  def create
    @user = Nguoidung.new user_params
    @user.mand = "ND#{Nguoidung.last.mand.last.to_i + 1}"
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
    params.require(:nguoidung).permit :ten, :email, :sdt, :diachi,
      :password, :password_confirmation, :role
  end

  def load_user
    @user = Nguoidung.find_by mand: params[:id]
    return if @user
    flash[:danger] = "controller.user.load_fail"
    redirect_to login_path
  end

  def correct_user
    @user = Nguoidung.find_by mand: params[:id]
    return if current_user?(@user)
    flash[:danger] = "controller.user.incorrect"
    redirect_to current_user
  end
end
