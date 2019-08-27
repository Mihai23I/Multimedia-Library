class AddDubbedToPhysicalVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :physical_videos, :dubbed, :string, default: nil
    add_column :videos, :language, :string
  end
end
