class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      flash[:success] = "Đăng nhập thành công!!"
      log_in user
      if user.admin?
        redirect_to admin_root_path
      else
        redirect_to root_path
      end
    else
      flash.now[:danger] = "Đăng nhập thất bại!!"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
