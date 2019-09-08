class Administrator::PhysicalVideosController < AdminsController
  before_action :set_physical_video, only: [:show, :edit, :update, :destroy]

  # GET /administrator/physical_videos
  def index
    @q = PhysicalVideo.ransack(params[:q])
    @physical_videos = @q.result.order(updated_at: :desc).page(params[:page])
  end

  # GET /administrator/physical_videos/1
  def show
  end

  # GET /administrator/physical_videos/new
  def new
    @physical_video = PhysicalVideo.new
    @physical_video.build_physical_item
  end

  # GET /administrator/physical_videos/1/edit
  def edit
  end

  # POST /administrator/physical_videos
  def create
    @physical_video = PhysicalVideo.new(physical_video_params)

    if @physical_video.save
      redirect_to [:administrator, @physical_video], notice: 'Physical video was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/physical_videos/1
  def update
    if @physical_video.update(physical_video_params)
      redirect_to [:administrator, @physical_video], notice: 'Physical video was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/physical_videos/1
  def destroy
    @physical_video.destroy
    redirect_to administrator_physical_videos_url, notice: 'Physical video was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physical_video
      @physical_video = PhysicalVideo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def physical_video_params
      params.require(:physical_video).permit(:physical_item_id, :is_3d, :format, :resolution, :sound, :dubbed, :other_information, physical_item_attributes: [:location_id, :category, :item_id])
    end
end
