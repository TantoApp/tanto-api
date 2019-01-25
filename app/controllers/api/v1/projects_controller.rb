class Api::V1::ProjectsController < ApplicationController
  before_action :set_api_v1_project, only: [:show, :update, :destroy]

  # GET /api/v1/projects
  def index
    @api_v1_projects = Project.all

    render json: @api_v1_projects
  end

  # GET /api/v1/projects/1
  def show
    render json: @api_v1_project
  end

  # POST /api/v1/projects
  def create
    @api_v1_project = Project.new(api_v1_project_params)

    if @api_v1_project.save
      render json: @api_v1_project, status: :created, location: @api_v1_project
    else
      render json: @api_v1_project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/projects/1
  def update
    if @api_v1_project.update(api_v1_project_params)
      render json: @api_v1_project
    else
      render json: @api_v1_project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/projects/1
  def destroy
    @api_v1_project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_project
      @api_v1_project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_project_params
      params.require(:api_v1_project).permit(:name, :description, :status, :active)
    end
end
