module Admin::BooksHelper
  def select_category
    Category.all.map{|c| [c.name, c.id]}
  end

  def select_import
    Import.all.map{|p| [p.book.name, p.book.id]}.uniq
  end
end
