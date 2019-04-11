class Admin::BooksController < AdminController
  before_action :load_book, only: %i(edit show update destroy)

  def index
    if params[:book] && params[:book][:category_id]
      @books = Book.by_category params[:book][:category_id]
    else
      @books = Book.all
    end
    @books = @books.newest.paginate page: params[:page],
      per_page: 5
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = "Thêm sách thành công!"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @book.update_attributes book_params
      flash[:success] = "Sửa sách thành công!"
      redirect_to admin_book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = "Xóa sách thành công!"
    else
      flash[:danger] = "Xóa sách thất bại!"
    end
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit :category_id, :publisher_id, :name,
      :content, :num_of_pages, :year, :price, :image, :author_id
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = "Không tìm thấy sách!"
    redirect_to admin_books_path
  end
end
