class AddCountryToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :country, :string
  end
end
