class TimeEntry < ActiveRecord::Base
  attr_accessible :comments, :task_id, :time, :user_id

  belongs_to :user
  belongs_to :task
  has_many :notes, :as => :item

end
