class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :donhangs, id: false do |t|
      t.string :madh, primary_key: true
      t.string :mand
      t.date :ngaydat
      t.boolean :diachinhan, default: false
      t.integer :tongtien
      t.integer :trangthai, default: 0
      t.timestamps
    end
  end
end
