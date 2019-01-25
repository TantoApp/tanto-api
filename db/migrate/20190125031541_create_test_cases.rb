class CreateTestCases < ActiveRecord::Migration[5.2]
  def change
    create_table :test_cases do |t|
      t.string :description
      t.integer :status
      t.integer :project_id
      t.boolean :active

      t.timestamps
    end
  end
end
