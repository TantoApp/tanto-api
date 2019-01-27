#:delete
class TestCase::Delete < Trailblazer::Operation
  step Model(TestCase, :find_by)
  step :delete_with_dependents!

  def delete_with_dependents!(options, model:, **)
    ActiveRecord::Base.transaction do
      # insert something like
      result = ::Test::Index.call(test_case_id: model.id)
      result["model"].map(&:id).each do |tc_id|
        ::Test::Delete.call(id: tc_id)
      end
      # Ideally, we won't do this for direct relations,
      # but only for relations outside the bounded context
      # Or let the frontend's light backend orchestrator do the talking.
      model.destroy
    end
  end
end
#:delete end
