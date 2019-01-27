class Api::V1::TestsController < ApplicationController
  before_action :set_test, only: [:show, :update, :destroy]

  # GET /api/v1/tests
  def index
    @tests = Test.all

    render json: @tests
  end

  # GET /api/v1/tests/1
  def show
    render json: @test
  end

  # POST /api/v1/tests
  def create
    @test = Test.new(test_params)

    if @test.save
      render json: @test, status: :created, location: @api_v1_test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tests/1
  def update
    if @test.update(test_params)
      render json: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tests/1
  def destroy
    @test.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_params
      params.require(:test).permit(:description, :status, :test_case_id, :active)
    end
end
