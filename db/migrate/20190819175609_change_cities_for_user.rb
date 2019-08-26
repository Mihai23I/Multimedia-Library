class ChangeCitiesForUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :city
    add_reference :users, :city, index: true, forgeign_key: true
  end
end
