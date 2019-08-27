class Location < ApplicationRecord
  enum category: { video: 'video', audio: 'audio', book: 'book' }

  belongs_to :physical_items
  has_and_belongs_to_many :locations
end
