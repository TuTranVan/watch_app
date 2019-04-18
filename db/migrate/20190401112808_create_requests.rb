class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.date :from_date
      t.date :to_date
      t.date :real_date
      t.float :forfeit, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
