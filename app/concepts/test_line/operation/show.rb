class TestLine::Show < Trailblazer::Operation
  step Model(TestLine, :find_by)
end
