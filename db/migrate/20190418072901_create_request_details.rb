class CreateRequestDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :chitietdhs do |t|
      t.string :madh
      t.string :masp
      t.integer :soluong, default: false
      t.integer :dongia, default: false
      t.timestamps
    end
  end
end
