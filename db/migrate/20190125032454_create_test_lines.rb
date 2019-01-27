class CreateTestLines < ActiveRecord::Migration[5.2]
  def change
    create_table :test_lines do |t|
      t.text :description
      t.integer :test_id
      t.integer :status, default: 0
      t.boolean :active, default: true
      
      t.timestamps
    end
  end
end
