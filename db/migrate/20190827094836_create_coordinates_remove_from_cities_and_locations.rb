class CreateCoordinatesRemoveFromCitiesAndLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinates_remove_from_cities_and_locations do |t|
      remove_column :cities, :latitude
      remove_column :cities, :longitude
      remove_column :locations, :latitude
      remove_column :locations, :longitude

      create_table :coordinates do |t|
        t.decimal :latitude, null: false
        t.decimal :longitude, null: false

        t.timestamps
      end

      add_reference :cities, :coordinate, foreign_key: true
      add_reference :locations, :coordinate, foreign_key: true
    end
  end
end
