class CreateTestCaseRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :test_case_requirements do |t|
      t.string :title
      t.string :description
      t.integer :status, default: 0
      t.integer :test_case_id

      t.timestamps
    end
  end
end
