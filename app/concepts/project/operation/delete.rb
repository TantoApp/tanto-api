#:delete
class Project::Delete < Trailblazer::Operation
  step Model(Project, :find_by)
  step :delete_with_dependents!

  def delete_with_dependents!(options, model:, **)
    ActiveRecord::Base.transaction do
      # insert something like
      result = ::TestCase::Index.call(project_id: model.id)
      result["model"].map(&:id).each do |tc_id|
        ::TestCase::Delete.call(id: tc_id)
      end
      # Ideally, we won't do this for direct relations,
      # but only for relations outside the bounded context
      # Or let the frontend's light backend orchestrator do the talking.
      model.destroy
    end
  end
end
#:delete end
