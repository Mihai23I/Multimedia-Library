class Location < ApplicationRecord
  before_create :add_coordinates

  validates :name, presence: true
  validates :address, presence: true
  validates :schedule, presence: true

  has_and_belongs_to_many :physical_items

  private

  def add_coordinates
    coordinates = Geocoder.search(address).first.coordinates
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end
end
