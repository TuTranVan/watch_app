class Admin::DonhangsController < AdminController
  before_action :load_donhang, only: %i(show confirm finish)

  def index
    if params[:request] && params[:request][:status]
      @donhangs = Donhang.by_status params[:request][:status]
    else
      @donhangs = Donhang.all
    end
    @donhangs = @donhangs.order_status
  end

  def show; end

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

  def load_donhang
    @donhang = Donhang.find_by id: params[:id]
    return if @donhang
    redirect_to admin_donhangs_path
  end
end
