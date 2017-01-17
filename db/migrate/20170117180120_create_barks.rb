class CreateBarks < ActiveRecord::Migration[5.0]
  def change
    create_table :barks do |t|
      t.text :title, null: false
      t.text :location, null: false
      t.text :content, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
