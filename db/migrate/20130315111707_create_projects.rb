class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :creator_id
      t.integer :manager_id
      t.string :status

      t.timestamps
    end
  end
end
