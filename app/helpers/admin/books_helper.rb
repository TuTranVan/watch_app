module Admin::BooksHelper
  def select_category
    Loaisp.all.map{|c| [c.ten, c.maloai]}
  end

  def select_nhaphang
    Nhaphang.all.map{|p| [p.sanpham.ten, p.sanpham.masp]}.uniq
  end

  def select_shipper
    Nguoidung.shipper.map{|u| ["# #{u.mand} - #{u.ten} - #{u.diachi} ", u.mand]}.uniq
  end
end
