class CreateImports < ActiveRecord::Migration[5.1]
  def change
    create_table :nhaphangs do |t|
      t.references :user, foreign_key: true
      t.references :sanpham, foreign_key: true
      t.integer :soluong
      t.timestamps
    end
  end
end
