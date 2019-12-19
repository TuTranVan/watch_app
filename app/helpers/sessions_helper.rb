module SessionsHelper
  def cart
    session[:cart] ||= []
  end

  def cart_shop
    Sanpham.find cart
  end

  def check_in?(book)
    cart.each do |item|
      if item == book.id
        return false
      end
    end
    return true
  end

  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    return unless (user_id = session[:user_id])
    @current_user ||= User.find_by id: user_id
  end

  def logged_in?
    current_user.present?
  end

  def current_user? user
    user == current_user
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def select_role
    User.roles.keys.map {|role| [t("user_role.#{role}"), role]}
  end

  def select_request
    Donhang.trangthais.keys.map {|status| [t("status_request_profile.#{status}"), status]}
  end

  def comment_of_user? binhluan
    current_user.binhluans.find_by(id: binhluan.id).present?
  end

  def like? book
    current_user.likes.find_by(book_id: book.id).present?
  end
end
