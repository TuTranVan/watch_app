class CreateRequestDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :request_details do |t|
      t.references :book, foreign_key: true
      t.references :request, foreign_key: true
      t.boolean :damage, default: false
      t.boolean :miss, default: false
      t.timestamps
    end
  end
end
