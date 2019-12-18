class CreateNguoinhans < ActiveRecord::Migration[5.1]
  def change
    create_table :nguoinhans do |t|
      t.references :donhang, foreign_key: true
      t.string :hoten
      t.string :diachi
      t.string :sdt
      t.timestamps
    end
  end
end
