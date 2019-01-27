class Api::V1::ExternalResourcesController < ApplicationController
  before_action :set_external_resource, only: [:show, :update, :destroy]

  # GET /api/v1/external_resources
  def index
    @external_resources = ExternalResource.all

    render json: @external_resources
  end

  # GET /api/v1/external_resources/1
  def show
    render json: @external_resource
  end

  # POST /api/v1/external_resources
  def create
    @external_resource = ExternalResource.new(external_resource_params)

    if @external_resource.save
      render json: @external_resource, status: :created, location: @api_v1_external_resource
    else
      render json: @external_resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/external_resources/1
  def update
    if @external_resource.update(external_resource_params)
      render json: @external_resource
    else
      render json: @external_resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/external_resources/1
  def destroy
    @external_resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_resource
      @external_resource = ExternalResource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def external_resource_params
      params.require(:external_resource).permit(:resource, :parent_id, :parent_type, :resource_type)
    end
end
