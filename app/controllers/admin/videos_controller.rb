class Admin::VideosController < AdminsController
  def new
  end

  def create
    params = set_params
    @video = Video.new(video_params(params))
    @item = @video.build_item(item_params(params))
    if @video.save
      flash[:success] = 'Filmul a fost adaugat'
      redirect_to videos_url
    else
      flash.now[:danger] = 'Filmul nu a fost adaugat'
      render 'index'
    end
  end

  def edit
  end

  def update
  end


  def video_params(params)
    params.require(:video).permit(:year, :released, :director, :actors, :writer, :genres, :category, :awards, :rated, :imdb_rating, :imdb_url, :poster_url, :trailer_url)
  end

  def item_params(params)
    params.require(:video).permit(:name)
  end

  def set_params
    movie = omdb(params[:video][:imdb_id])
    params[:video][:year] = movie.year
    params[:video][:released] = movie.released
    params[:video][:director] = movie.director
    params[:video][:actors] = movie.actors
    params[:video][:language] = movie.language
    params[:video][:rated] = movie.rated
    params[:video][:writer] = movie.writer
    params[:video][:genres] = movie.genre
    params[:video][:category] = movie.type
    params[:video][:awards] = movie.awards
    params[:video][:rated] = movie.rated
    params[:video][:imdb_rating] = movie.imdb_rating
    params[:video][:imdb_url] = "https://www.imdb.com/title/#{params[:video][:imdb_id]}/"
    params[:video][:poster_url] = movie.poster
    params[:video][:name] = movie.title
    params
  end

  def omdb(imdb_id)
    client = Omdb::Api::Client.new(api_key: ENV["OMDB_API"])
    client.find_by_id(imdb_id)
  end
end
