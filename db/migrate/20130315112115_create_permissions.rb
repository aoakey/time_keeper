class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :project_id
      t.integer :user_id
      t.boolean :can_view
      t.boolean :can_edit
      t.boolean :can_record
      t.boolean :can_delete

      t.timestamps
    end
  end
end
