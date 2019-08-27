class Location < ApplicationRecord
  before_validation :add_coordinates, if: :address_changed?

  validates :name, presence: true
  validates :address, presence: true
  validates :schedule, presence: true

  has_many :physical_items
  belongs_to :coordinate

  private

  def add_coordinates
    coordinates = GeographicalService.coordinates(address)
    self.create_coordinate(latitude: coordinates[0], longitude: coordinates[1])
  end
end
