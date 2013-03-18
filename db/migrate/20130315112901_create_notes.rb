class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.text :note
      t.string :item_type
      t.integer :item_id

      t.timestamps
    end
  end
end
