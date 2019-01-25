class CreateTestLines < ActiveRecord::Migration[5.2]
  def change
    create_table :test_lines do |t|
      t.text :description
      t.integer :status
      t.integer :test_id
      t.boolean :active

      t.timestamps
    end
  end
end
