class CreateLocationsAndPhysicalItems < ActiveRecord::Migration[5.2]
  def change
    create_table :assemblies do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.string :schedule

      t.timestamps
    end

    create_table :physical_item do |t|
      t.string :category
      t.timestamps
    end

    create_table :locations_physical_items, id: false do |t|
      t.belongs_to :location
      t.belongs_to :physical_item
    end
  end
end
