class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :sanphams do |t|
      t.references :loaisp, foreign_key: true
      t.string :ten
      t.string :mausac
      t.string :thuonghieu
      t.string :xuatsu
      t.string :baohanh
      t.integer :soluong, default: 0, null: false
      t.integer :dongia
      t.string :hinhanh
      t.timestamps
    end
  end
end
