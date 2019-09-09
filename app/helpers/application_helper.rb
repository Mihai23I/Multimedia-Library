module ApplicationHelper
  include SessionsService

  def select_year
    Video.all.map{ |u| [u.year, u.year] }.uniq.sort.push('').reverse
  end

  def select_genre
    %w[Action Adult Adventure Animation Biography Comedy Crime Documentary Drama Family Fantasy Film Noir Game-Show History Horror Musical Music Mystery News Reality-TV Romance Sci-Fi Short Sport Talk-Show Thriller War Western].unshift('').map{ |u| [u, u] }
  end

  def select_status
    %w[Activ Rejectat Anulat Imprumutat Returnat]
  end

  def select_location
    Location.all.map{ |u| [u.name, u.id] }.uniq.sort.unshift('')
  end

  def select_format
    %w[DVD Blu-Ray].unshift('').map{ |u| [u, u] }
  end

  def select_resolution
    %w[480p 720p 1080p 4k 8k].unshift('').map{ |u| [u, u] }
  end

  def select_is_3d
    %w[true false].unshift('').map{ |u| [u, u] }
  end
end
