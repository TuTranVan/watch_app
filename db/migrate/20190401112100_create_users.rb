class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :nguoidungs, id: false do |t|
      t.string :mand, primary_key: true
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
