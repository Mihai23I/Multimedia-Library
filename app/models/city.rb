class City < ApplicationRecord
  before_validation :add_coordinates, if: :name_changed?

  validates :name, presence: true
  belongs_to :coordinate

  private

  before_validation :add_coordinates, if: :name_changed?

  def add_coordinates
    coordinates = Coordinate.determine(name)
    self.create_coordinate(latitude: coordinates[0], longitude: coordinates[1])
  end
end
