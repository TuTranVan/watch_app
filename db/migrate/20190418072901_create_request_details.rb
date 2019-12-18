class CreateRequestDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :chitietdhs do |t|
      t.references :donhang, foreign_key: true
      t.references :sanpham, foreign_key: true
      t.integer :soluong, default: false
      t.integer :dongia, default: false
      t.timestamps
    end
  end
end
