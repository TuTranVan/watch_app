class LoaispsController < ApplicationController
  before_action :load_loaisp, only: :show

  def show; end

  private

  def load_loaisp
    @loaisp = Loaisp.find_by maloai: params[:id]
    return if @loaisp
    redirect_to root_path
  end
end
