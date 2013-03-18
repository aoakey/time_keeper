class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :user_id
      t.float :time
      t.text :comments
      t.integer :task_id

      t.timestamps
    end
  end
end
