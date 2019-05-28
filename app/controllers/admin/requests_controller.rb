class Admin::RequestsController < AdminController
  before_action :load_request, only: %i(show destroy confirm finish)

  def index
    if params[:request] && params[:request][:status]
      @requests = Request.by_status params[:request][:status]
    else
      @requests = Request.all
    end
    @requests = @requests.order_status.paginate page: params[:page], per_page: 5
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
    @request.real_date = Date.current
    if @request.real_date > @request.to_date
      @request.forfeit = @request.forfeit + 2000*(real_date - to_date).to_i
    end
    @request.request_details.each do |detail|
      if detail.miss?
        @request.forfeit = @request.forfeit + detail.book.price
      else
        book = detail.book
        book.quantity = book.quantity + 1
        book.save
        if detail.damage?
          @request.forfeit = @request.forfeit + 0.3*detail.book.price
        end
      end
    end
    @request.finish!
    flash[:success] = "Xử lý thành công!"
    redirect_to admin_requests_path
  end

  private

  def load_request
    @request = Request.find_by id: params[:id]
    return if @request
    redirect_to admin_requests_path
  end
end
