class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :binhluans, id: false do |t|
      t.string :mabl, primary_key: true
      t.string :mand
      t.string :masp
      t.text :noidung
      t.timestamps
    end
  end
end
