class TestLine::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(TestLine, :new)
    step Contract::Build( constant: TestLine::Contract::Create )
  end

  step Nested( Present )
  step Contract::Validate( key: :test_line )
  failure :failed!

  step Contract::Persist( )
  step :notify!

  def notify!(options, model:, **)
    options["result.notify"] = Rails.logger.info("New TestLine #{model.description}.")
  end

  def failed!(options, model:, **)
    Rails.logger.error "Validation Failed" if options["result.contract.default"].try(:errors)
  end
end
