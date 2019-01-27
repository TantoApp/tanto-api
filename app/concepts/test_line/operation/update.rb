#:update
class TestLine::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(TestLine, :find_by)
    step Contract::Build( constant: TestLine::Contract::Update )
  end

  step Nested(Present)
  step Contract::Validate( key: :test_line )
  step Contract::Persist()
end
#:update end
