class Administrator::ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /administrator/clients
  def index
    @clients = Client.all
  end

  # GET /administrator/clients/1
  def show
  end

  # GET /administrator/clients/new
  def new
    @client = Client.new
  end

  # GET /administrator/clients/1/edit
  def edit
  end

  # POST /administrator/clients
  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to [:administrator, @client], notice: 'Client was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/clients/1
  def update
    if @client.update(client_params)
      redirect_to [:administrator, @client], notice: 'Client was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/clients/1
  def destroy
    @client.destroy
    redirect_to administrator_clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:id, :name, :phone, :address, :unique_identifier_code, :other_information)
    end
end
