class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :status, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
