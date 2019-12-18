class DonhangsController < ApplicationController
  before_action :load_request, only: %i(show)

  def create
    @request = current_user.requests.build request_params
    @request.to_date = @request.from_date + 30
    if @request.save
      cart.each do |book|
        rd = @request.request_details.build book_id: book['id']
        rd.save
        b = load_book book['id']
        b.quantity = b.quantity - 1
        b.save
      end
      cart.clear
      flash[:success] = "Mượn sách thành công!"
      redirect_to current_user
    else
      flash[:danger] = "Có lỗi trong quá trình mượn sách. Vui lòng kiểm tra thông tin!"
      redirect_to carts_path
    end
  end

  def show; end

  private

  def request_params
    params.require(:request).permit :from_date
  end

  def load_request
    @request = Request.find_by id: params[:id]
    return if @request
    redirect_to current_user
  end

  def load_book id
    book = Book.find_by id: id
  end
end
