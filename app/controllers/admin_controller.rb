class AdminController < ApplicationController
  before_action :logged_in_user, :authorized?

  private

  def authorized?
    return unless current_user.user? ||current_user.shipper?
    redirect_to current_user
  end
end
