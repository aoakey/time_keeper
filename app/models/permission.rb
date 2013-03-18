class Permission < ActiveRecord::Base
  attr_accessible :can_delete, :can_edit, :can_record, :can_view, :project_id, :user_id

  belongs_to :user
  belongs_to :project

end
