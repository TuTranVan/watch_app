class CreateImports < ActiveRecord::Migration[5.1]
  def change
    create_table :nhaphangs, id: false  do |t|
      t.string :manh, primary_key: true
      t.string :mand
      t.string :masp
      t.integer :soluong
      t.timestamps
    end
  end
end
