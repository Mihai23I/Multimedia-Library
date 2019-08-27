class RemoveHasManyForLocationsPhysicalItems < ActiveRecord::Migration[5.2]
  def change
    drop_table :locations_physical_items
    add_reference :physical_items, :location, foreign_key: true
  end
end
