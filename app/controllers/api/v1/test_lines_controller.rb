class Api::V1::TestLinesController < ApplicationController
  def index
    run TestLine::Index
    render json: result["model"]
  end

  def show
    run TestLine::Show
    render json: result["model"]
  end

  def create
    run TestLine::Create do |result|
      if (errors = result["result.contract.default"].try(:errors)).present?
        render json: errors, status: :unprocessable_entity
      else
        render json: result['model'], status: :created, location: @api_v1_test_line
      end
    end
  end

  def update
    run TestLine::Update do |result|
      if (errors = result["result.contract.default"].try(:errors)).present?
        render json: errors, status: :unprocessable_entity
      else
        render json: result['model'], status: :created, location: @api_v1_test_line
      end
    end
  end

  def destroy
    run TestLine::Delete
  end
end
