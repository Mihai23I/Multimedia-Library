class RemoveUnusedTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :coordinates_remove_from_cities_and_locations
  end
end
