class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def show; end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    redirect_to root_path
  end
end
