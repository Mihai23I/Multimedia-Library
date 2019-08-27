class PhysicalItem < ApplicationRecord
  enum category: { video: 'video', audio: 'audio', book: 'book' }

  has_many :users, through: :loans
  has_and_belongs_to_many :locations
end
