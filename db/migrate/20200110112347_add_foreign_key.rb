class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :sanphams, :loaisps, column: :maloai, primary_key: :maloai
    add_foreign_key :binhluans, :nguoidungs, column: :mand, primary_key: :mand
    add_foreign_key :binhluans, :sanphams, column: :masp, primary_key: :masp
    add_foreign_key :donhangs, :nguoidungs, column: :mand, primary_key: :mand
    add_foreign_key :donhangs, :nguoidungs, column: :magh, primary_key: :mand
    add_foreign_key :nhaphangs, :nguoidungs, column: :mand, primary_key: :mand
    add_foreign_key :nhaphangs, :sanphams, column: :masp, primary_key: :masp
    add_foreign_key :chitietdhs, :donhangs, column: :madh, primary_key: :madh
    add_foreign_key :chitietdhs, :sanphams, column: :masp, primary_key: :masp
    add_foreign_key :nguoinhans, :donhangs, column: :madh, primary_key: :madh
  end
end
