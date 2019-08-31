class PhysicalItem < ApplicationRecord
  enum category: { video: 'video', audio: 'audio', book: 'book' }

  has_many :clients, through: :loans
  belongs_to :location
  belongs_to :item
end
