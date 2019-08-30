class RemoveVideoFromPhysicalVideos < ActiveRecord::Migration[5.2]
  def change
    change_table :physical_videos do |t|
      t.remove_references :video
    end
  end
end
