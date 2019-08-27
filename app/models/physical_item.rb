class PhysicalItem < ApplicationRecord
  enum category: { video: 'video', audio: 'audio', book: 'book' }

  has_many :users, through: :loans
  belongs_to :location
end
