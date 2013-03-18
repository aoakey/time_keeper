class Note < ActiveRecord::Base
  attr_accessible :item_id, :item_table, :note, :user_id

  belongs_to :user
  belongs_to :item, :polymorphic => true

end
