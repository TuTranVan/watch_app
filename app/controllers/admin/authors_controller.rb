class Admin::AuthorsController < AdminController
  before_action :load_author, only: %i(edit update destroy)

  def index
    @authors = Author.alphabet.paginate page: params[:page], per_page: 5
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = "Thêm tác giả thành công!"
      redirect_to admin_authors_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @author.update_attributes author_params
      flash[:success] = "Cập nhật tác giả thành công!"
      redirect_to admin_authors_path
    else
      render :edit
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = "Xóa tác giả thành công!"
    else
      flash[:danger] = "Xóa tác giả thất bại!"
    end
    redirect_to admin_authors_path
  end

  private

  def author_params
    params.require(:author).permit :name
  end

  def load_author
    @author = Author.find_by id: params[:id]
    return if @author
    flash[:danger] = "Không tìm thấy!"
    redirect_to admin_authors_path
  end
end
