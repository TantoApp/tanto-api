class Api::V1::TestLinesController < ApplicationController
  before_action :set_api_v1_test_line, only: [:show, :update, :destroy]

  # GET /api/v1/test_lines
  def index
    @api_v1_test_lines = TestLine.all

    render json: @api_v1_test_lines
  end

  # GET /api/v1/test_lines/1
  def show
    render json: @api_v1_test_line
  end

  # POST /api/v1/test_lines
  def create
    @api_v1_test_line = TestLine.new(api_v1_test_line_params)

    if @api_v1_test_line.save
      render json: @api_v1_test_line, status: :created, location: @api_v1_test_line
    else
      render json: @api_v1_test_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/test_lines/1
  def update
    if @api_v1_test_line.update(api_v1_test_line_params)
      render json: @api_v1_test_line
    else
      render json: @api_v1_test_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/test_lines/1
  def destroy
    @api_v1_test_line.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_test_line
      @api_v1_test_line = TestLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_test_line_params
      params.require(:api_v1_test_line).permit(:description, :status, :test_id, :active)
    end
end
