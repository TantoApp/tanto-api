class Api::V1::TestCasesController < ApplicationController
  before_action :set_api_v1_test_case, only: [:show, :update, :destroy]

  # GET /api/v1/test_cases
  def index
    @api_v1_test_cases = TestCase.all

    render json: @api_v1_test_cases
  end

  # GET /api/v1/test_cases/1
  def show
    render json: @api_v1_test_case
  end

  # POST /api/v1/test_cases
  def create
    @api_v1_test_case = TestCase.new(api_v1_test_case_params)

    if @api_v1_test_case.save
      render json: @api_v1_test_case, status: :created, location: @api_v1_test_case
    else
      render json: @api_v1_test_case.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/test_cases/1
  def update
    if @api_v1_test_case.update(api_v1_test_case_params)
      render json: @api_v1_test_case
    else
      render json: @api_v1_test_case.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/test_cases/1
  def destroy
    @api_v1_test_case.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_test_case
      @api_v1_test_case = TestCase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_test_case_params
      params.require(:api_v1_test_case).permit(:description, :status, :project_id, :active)
    end
end
