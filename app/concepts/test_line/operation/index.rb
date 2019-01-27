class TestLine::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] =
      if t_id = options["params"][:test_id] # probably do a better query
        ::TestLine.where(test_id: t_id)
      else
        ::TestLine.all
      end
  end
end
