class AddItemToPhysicalItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :physical_items, :item, foreign_key: true
  end
end
