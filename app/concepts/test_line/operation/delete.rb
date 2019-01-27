#:delete
class TestLine::Delete < Trailblazer::Operation
  step Model(TestLine, :find_by)
  step :delete!

  def delete!(options, model:, **)
    model.destroy
  end
end
#:delete end
