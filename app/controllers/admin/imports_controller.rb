class Admin::ImportsController < AdminController
  before_action :load_import, only: %i(destroy)

  def index
    @imports = Import.newest.paginate page: params[:page], per_page: 5
  end

  def create
    @import = current_user.imports.build import_params
    if @import.save
      flash[:success] = "Cập nhật thành công"
      book = @import.book
      book.quantity += @import.quantity
      book.save
    else
      flash[:danger] = "Cập nhật thất bại"
    end
    redirect_to admin_book_path @import.book
  end

  def destroy
    if @import.destroy
      flash[:success] = "Xóa loại sách thành công!"
      book = @import.book
      book.quantity -= @import.quantity
      book.save
    else
      flash[:danger] = "Xóa loại sách thất bại!"
    end
    redirect_to admin_imports_path
  end

  private

  def import_params
    params.require(:import).permit :book_id, :quantity
  end

  def load_import
    @import = Import.find_by id: params[:id]
    return if @import
    redirect_to admin_imports_path
  end
end
