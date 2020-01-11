class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :sanphams, id: false do |t|
      t.string :masp, primary_key: true
      t.string :maloai
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
