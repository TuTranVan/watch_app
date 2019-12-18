class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :ten
      t.string :email
      t.string :password_digest
      t.string :diachi
      t.string :sdt
      t.integer :role, default: 0, null: false
      t.timestamps
    end
  end
end
