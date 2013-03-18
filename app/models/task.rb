class Task < ActiveRecord::Base
  attr_accessible :assigned_id, :creator_id, :description, :name, :project_id, :status, :parent_id

  belongs_to :project
  belongs_to :creator, :class_name => "User"
  belongs_to :assigned, :class_name => "User"
  belongs_to :parent_task, :class_name => "Task"
  belongs_to :sub_tasks, :class_name => "Task", :foreign_key => "parent_id"
  has_many :notes, :as => :item

end
