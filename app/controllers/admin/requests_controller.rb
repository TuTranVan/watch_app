class Admin::RequestsController < AdminController
  before_action :load_request, only: %i(show destroy confirm finish)

  def index
    @requests = Request.paginate page: params[:page], per_page: 5
  end

  def show; end

  def destroy
    @request.request_details.each do |detail|
      book = detail.book
      book.quantity = book.quantity + 1
      book.save
    end
    if @request.destroy
      flash[:success] = "Hủy yêu cầu thành công!"
    else
      flash[:danger] = "Hủy yêu cầu thất bại!"
    end
    redirect_to admin_requests_path
  end

  def confirm
    @request.processing!
    redirect_to admin_requests_path
  end

  def finish
    # @request.real_date = Date.now
    redirect_to admin_requests_path
  end

  private

  def load_request
    @request = Request.find_by id: params[:id]
    return if @request
    redirect_to admin_requests_path
  end
end
