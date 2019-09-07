class Administrator::VideosController < AdminsController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /administrator/videos
  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result.order(updated_at: :desc).page(params[:page])
  end

  # GET /administrator/videos/1
  def show
  end

  # GET /administrator/videos/new
  def new
    @video = Video.new
  end

  # GET /administrator/videos/1/edit
  def edit
  end

  # POST /administrator/videos
  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to [:administrator, @video], notice: 'Video was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/videos/1
  def update
    if @video.update(video_params)
      redirect_to [:administrator, @video], notice: 'Video was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/videos/1
  def destroy
    @video.destroy
    redirect_to administrator_videos_url, notice: 'Video was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def video_params
      params.require(:video).permit(:item_id, :year, :language, :released, :director, :actors, :writer, :genres, :category, :awards, :rated, :imdb_rating, :imdb_url, :trailer_url, :poster_url)
    end
end
