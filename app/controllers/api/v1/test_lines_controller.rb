class Api::V1::TestLinesController < ApplicationController
  before_action :set_test_line, only: [:show, :update, :destroy]

  # GET /api/v1/test_lines
  def index
    @test_lines = TestLine.all

    render json: @test_lines
  end

  # GET /api/v1/test_lines/1
  def show
    render json: @test_line
  end

  # POST /api/v1/test_lines
  def create
    @test_line = TestLine.new(test_line_params)

    if @test_line.save
      render json: @test_line, status: :created, location: @api_v1_test_line
    else
      render json: @test_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/test_lines/1
  def update
    if @test_line.update(test_line_params)
      render json: @test_line
    else
      render json: @test_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/test_lines/1
  def destroy
    @test_line.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_line
      @test_line = TestLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_line_params
      params.require(:test_line).permit(:description, :status, :test_id, :active)
    end
end
