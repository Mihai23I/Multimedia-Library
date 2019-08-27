class Location < ApplicationRecord
  enum category: { video: 'video', audio: 'audio', book: 'book' }

  has_and_belongs_to_many :locations
end
