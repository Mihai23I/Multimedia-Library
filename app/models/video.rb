class Video < ApplicationRecord
  belongs_to :item

  validates :year, presence: true
  validates :released, presence: true
  validates :director, presence: true
  validates :actors, presence: true
  validates :writer, presence: true
  validates :genres, presence: true
  validates :type, presence: true
  validates :awards, presence: true
  validates :rated, presence: true
  validates :imdb_rating, presence: true
  validates :trailer_url if :valid_trailer_url?
  validates :poster_url if :valid_poster_url?
  validates :imdb_url, presence: true, if :valid_imdb_url?

  private

    def valid_poster_url?
      return true if poster_url.nil? or uri?(poster_url)
    end

    def valid_imdb_url?
      return true if uri?(imdb_url)
    end

    def valid_trailer_url?
      return true if trailer_url.nil? or uri?(trailer_url)
    end

    def url?(string)
      url = URI.parse(string)
      %w( http https ).include?(url.scheme)
    rescue URI::BadURIError
      false
    rescue URI::InvalidURIError
      false
    end
end
