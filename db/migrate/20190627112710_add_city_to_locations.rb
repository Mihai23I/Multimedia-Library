class AddCityToLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :city, foreign_key: true
  end
end
