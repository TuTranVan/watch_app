class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :donhangs do |t|
      t.references :user, foreign_key: true
      t.date :ngaydat
      t.boolean :diachinhan, default: false
      t.integer :tongtien
      t.integer :trangthai, default: 0
      t.timestamps
    end
  end
end
