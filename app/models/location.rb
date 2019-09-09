class Location < ApplicationRecord
  before_validation :add_coordinates, if: :address_changed?

  validates :name, presence: true
  validates :address, presence: true
  validates :schedule, presence: true

  has_many :physical_items
  belongs_to :coordinate
  belongs_to :city

  private

  def add_coordinates
    coordinates = Coordinate.determine(address)
    coordinate = Coordinate.create(latitude: coordinates[0], longitude: coordinates[1])
    self.coordinate = coordinate
  end
end
