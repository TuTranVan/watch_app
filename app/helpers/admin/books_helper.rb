module Admin::BooksHelper
  def select_category
    Loaisp.all.map{|c| [c.ten, c.id]}
  end

  def select_nhaphang
    Nhaphang.all.map{|p| [p.sanpham.ten, p.sanpham.id]}.uniq
  end
end
