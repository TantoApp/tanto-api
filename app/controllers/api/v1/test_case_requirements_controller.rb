class Api::V1::TestCaseRequirementsController < ApplicationController
  before_action :set_test_case_requirement, only: [:show, :update, :destroy]

  # GET /api/v1/test_case_requirements
  def index
    @test_case_requirements = TestCaseRequirement.all

    render json: @test_case_requirements
  end

  # GET /api/v1/test_case_requirements/1
  def show
    render json: @test_case_requirement
  end

  # POST /api/v1/test_case_requirements
  def create
    @test_case_requirement = TestCaseRequirement.new(test_case_requirement_params)

    if @test_case_requirement.save
      render json: @test_case_requirement, status: :created, location: @api_v1_test_case_requirement
    else
      render json: @test_case_requirement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/test_case_requirements/1
  def update
    if @test_case_requirement.update(test_case_requirement_params)
      render json: @test_case_requirement
    else
      render json: @test_case_requirement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/test_case_requirements/1
  def destroy
    @test_case_requirement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_case_requirement
      @test_case_requirement = TestCaseRequirement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_case_requirement_params
      params.require(:test_case_requirement).permit(:title, :description, :status, :test_case_id)
    end
end
