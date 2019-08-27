class Item < ApplicationRecord
  has_one :video

  validates :name, presence: true
end
