class Administrator::ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result.order(updated_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to [:administrator, @client], notice: 'Client was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to [:administrator, @client], notice: 'Client was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to administrator_clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:id, :name, :phone, :address, :unique_identifier_code, :other_information)
    end
end
