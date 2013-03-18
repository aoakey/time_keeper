class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :project_id
      t.integer :creator_id
      t.integer :assigned_id
      t.integer :parent_id
      t.string :status

      t.timestamps
    end
  end
end
