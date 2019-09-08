class PhysicalVideo < ApplicationRecord
  belongs_to :physical_item

  accepts_nested_attributes_for :physical_item
end
