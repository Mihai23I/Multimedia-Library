class City < ApplicationRecord
  before_validation :add_coordinates, if: :name_changed?

  validates :name, presence: true
  belongs_to :coordinate

  private

  def add_coordinates
    coordinates = Coordinate.determine(name)
    coordinate = Coordinate.create(latitude: coordinates[0], longitude: coordinates[1])
    self.coordinate_id = coordinate.id
  end
end
