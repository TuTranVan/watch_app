class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :loaisps do |t|
      t.string :ten
      t.timestamps
    end
  end
end
