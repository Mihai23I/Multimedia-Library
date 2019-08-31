class Item < ApplicationRecord
  has_one :video
  has_many :physical_items

  validates :name, presence: true
end
