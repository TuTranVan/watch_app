class AddShipperToDonhangs < ActiveRecord::Migration[5.1]
  def change
    add_column :donhangs, :magh, :integer
  end
end
