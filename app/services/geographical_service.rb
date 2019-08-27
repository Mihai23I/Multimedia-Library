module GeographicalService
  def self.coordinates(address)
    Geocoder.search(address).first.coordinates
  end
end
