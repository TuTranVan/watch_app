class CreateNguoinhans < ActiveRecord::Migration[5.1]
  def change
    create_table :nguoinhans, id: false do |t|
      t.string :mann, primary_key: true
      t.string :madh
      t.string :hoten
      t.string :diachi
      t.string :sdt
      t.timestamps
    end
  end
end
