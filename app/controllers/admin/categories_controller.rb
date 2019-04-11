class Admin::CategoriesController < AdminController
  before_action :load_category, only: %i(edit update destroy)

  def index
    @categories = Category.alphabet.paginate page: params[:page],
      per_page: 5
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Thêm loại sách thành công!"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Cập nhật loại sách thành công!"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Xóa loại sách thành công!"
    else
      flash[:danger] = "Xóa loại sách thất bại!"
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    redirect_to admin_categories_path
  end
end
