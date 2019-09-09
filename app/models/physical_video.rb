class PhysicalVideo < ApplicationRecord
  belongs_to :physical_item
  has_one :location, through: :physical_item

  scope :filter_location, lambda { |string|
    return nil if string.blank?

    joins(:locations).where("locations.id = ?", string.to_i.to_s).distinct
  }

  scope :filter_format, lambda { |string|
    return nil if string.blank?

    where(format: string)
  }

  scope :filter_resolution, lambda { |string|
    return nil if string.blank?

    where(resolution: string)
  }

  scope :filter_is_3d, lambda { |string|
    return nil if string.blank?

    where(is_3d: string)
  }

  accepts_nested_attributes_for :physical_item
end
