class CreateExternalResources < ActiveRecord::Migration[5.2]
  def change
    create_table :external_resources do |t|
      t.string :resource
      t.integer :parent_id
      t.string :parent_type
      t.string :resource_type

      t.timestamps
    end
  end
end
