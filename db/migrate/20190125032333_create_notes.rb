class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :note
      t.integer :parent_id
      t.string :parent_type

      t.timestamps
    end
  end
end
