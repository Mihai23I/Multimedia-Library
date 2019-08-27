class PhysicalVideo < ApplicationRecord
  belongs_to :video
  belongs_to :physical_item
end
