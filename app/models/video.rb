# frozen_string_literal: true

class Video < ApplicationRecord
  belongs_to :item
  has_many :physical_items, through: :item
  has_many :locations, through: :physical_items

  validates :year, presence: true
  validates :released, presence: true
  validates :director, presence: true
  validates :actors, presence: true
  validates :writer, presence: true
  validates :genres, presence: true
  validates :category, presence: true
  validates :awards, presence: true
  validates :rated, presence: true
  validates :imdb_rating, presence: true
  validate :trailer_url, if: :valid_trailer_url?
  validate :poster_url, if: :valid_poster_url?
  validates :imdb_url, presence: true
  validate :imdb_url, if: :valid_imdb_url?

  paginates_per 12

  scope :search_name, lambda { |string|
    return nil if string.blank?

    terms = string.downcase.split(/\s+/)

    terms = terms.map do |e|
      ('%' + e.tr('*', '%') + '%').gsub(/%+/, '%')
    end
    num_or_conds = 1
    joins(:item).where(
      terms.map do |_term|
        '(LOWER(items.name) LIKE ?)'
      end.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  scope :filter_location, lambda { |string|
    return nil if string.blank?

    join(:locations).where("locations.id = ?", string)
  }

  scope :filter_year, lambda { |string|
    return nil if string.blank?

    where(year: string)
  }

  scope :search_genre, lambda { |string|
    return nil if string.blank?

    string = ('%' + string.tr('*', '%') + '%').gsub(/%+/, '%')
    where("genres LIKE ?", "#{string}%")
  }

  scope :search_actors, lambda { |string|
    return nil if string.blank?

    terms = string.downcase.split(/\s+/)

    terms = terms.map do |e|
      ('%' + e.tr('*', '%') + '%').gsub(/%+/, '%')
    end
    num_or_conds = 1
    where(
      terms.map do |_term|
        '(LOWER(actors) LIKE ?)'
      end.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  private

  def valid_poster_url?
    return true if poster_url.nil? || uri?(poster_url)
  end

  def valid_imdb_url?
    return true if uri?(imdb_url)
  end

  def valid_trailer_url?
    return true if trailer_url.nil? || uri?(trailer_url)
  end

  def uri?(string)
    uri = URI.parse(string)
    %w[http https].include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
end
