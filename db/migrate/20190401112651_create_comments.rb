class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :binhluans do |t|
      t.references :user, foreign_key: true
      t.references :sanpham, foreign_key: true
      t.text :noidung
      t.timestamps
    end
  end
end
