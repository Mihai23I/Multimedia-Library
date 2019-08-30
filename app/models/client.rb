class Client < ApplicationRecord
  has_many :physical_items, through: :loans
  has_one :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, length: { maximum: 255 }
  validates :phone, length: { is: 10 }, allow_nil: true, allow_blank: true, numericality: true
  validates :phone, length: { is: 13 }, allow_nil: true, allow_blank: true, numericality: true
end
