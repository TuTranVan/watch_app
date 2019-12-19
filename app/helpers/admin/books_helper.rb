module Admin::BooksHelper
  def select_category
    Loaisp.all.map{|c| [c.ten, c.id]}
  end

  def select_nhaphang
    Nhaphang.all.map{|p| [p.sanpham.ten, p.sanpham.id]}.uniq
  end

  def select_shipper
    User.shipper.map{|u| ["# #{u.id} - #{u.ten} - #{u.diachi} ", u.id]}.uniq
  end
end
