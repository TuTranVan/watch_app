class CreateImports < ActiveRecord::Migration[5.1]
  def change
    create_table :imports do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end
