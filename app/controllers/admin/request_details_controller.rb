class Admin::RequestDetailsController < AdminController
  before_action :load_request_detail

  def normal
    @request_detail.damage = false
    @request_detail.miss = false
    @request_detail.save
    redirect_to admin_request_path(@request_detail.request)
  end

  def damage
    @request_detail.damage = true
    @request_detail.miss = false
    @request_detail.save
    redirect_to admin_request_path(@request_detail.request)
  end

  def miss
    @request_detail.damage = false
    @request_detail.miss = true
    @request_detail.save
    redirect_to admin_request_path(@request_detail.request)
  end

  private

  def load_request_detail
    @request_detail = RequestDetail.find_by id: params[:id]
    return if @request_detail
    redirect_to admin_requests_path
  end
end
