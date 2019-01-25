class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :description
      t.integer :status
      t.integer :test_case_id
      t.boolean :active

      t.timestamps
    end
  end
end
