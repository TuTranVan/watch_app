class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :loaisps, id: false do |t|
      t.string :maloai, primary_key: true

      t.string :ten
      t.timestamps
    end
  end
end
