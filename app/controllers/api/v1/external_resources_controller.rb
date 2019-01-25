class Api::V1::ExternalResourcesController < ApplicationController
  before_action :set_api_v1_external_resource, only: [:show, :update, :destroy]

  # GET /api/v1/external_resources
  def index
    @api_v1_external_resources = ExternalResource.all

    render json: @api_v1_external_resources
  end

  # GET /api/v1/external_resources/1
  def show
    render json: @api_v1_external_resource
  end

  # POST /api/v1/external_resources
  def create
    @api_v1_external_resource = ExternalResource.new(api_v1_external_resource_params)

    if @api_v1_external_resource.save
      render json: @api_v1_external_resource, status: :created, location: @api_v1_external_resource
    else
      render json: @api_v1_external_resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/external_resources/1
  def update
    if @api_v1_external_resource.update(api_v1_external_resource_params)
      render json: @api_v1_external_resource
    else
      render json: @api_v1_external_resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/external_resources/1
  def destroy
    @api_v1_external_resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_external_resource
      @api_v1_external_resource = ExternalResource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_external_resource_params
      params.require(:api_v1_external_resource).permit(:resource, :parent_id, :parent_type, :resource_type)
    end
end
