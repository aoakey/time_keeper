class Project < ActiveRecord::Base
  attr_accessible :creator_id, :description, :end_date, :manager_id, :name, :start_date, :status

  belongs_to :creator, :class_name => "User"
  belongs_to :assigned, :class_name => "User"
  has_many :permissions
  has_many :users, through: :permissions
  has_many :tasks
  has_many :notes, :as => :item

end
