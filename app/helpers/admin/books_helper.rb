module Admin::BooksHelper
  def select_author
    Author.all.map{|a| [a.name, a.id]}
  end

  def select_category
    Category.all.map{|c| [c.name, c.id]}
  end

  def select_publisher
    Publisher.all.map{|p| [p.name, p.id]}
  end

  def select_import
    Import.all.map{|p| [p.book.name, p.book.id]}.uniq
  end
end
