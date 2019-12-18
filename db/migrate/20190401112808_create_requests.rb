class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :donhangs do |t|
      t.references :user, foreign_key: true
      t.date :ngaydat
      t.string :hoten
      t.string :diachi
      t.string :sdt
      t.date :tongtien
      t.integer :trangthai, default: 0
      t.timestamps
    end
  end
end
