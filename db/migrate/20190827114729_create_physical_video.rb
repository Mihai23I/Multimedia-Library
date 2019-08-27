class CreatePhysicalVideo < ActiveRecord::Migration[5.2]
  def change
    create_table :physical_videos do |t|
      t.belongs_to :physical_item
      t.belongs_to :video
      t.boolean :is_3d, default: 0
      t.string :format
      t.string :resolution
      t.string :sound
      t.text :other_information
    end
  end
end
