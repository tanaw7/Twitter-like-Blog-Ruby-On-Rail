class Fellowship < ActiveRecord::Base
  attr_accessible :fellow_id, :fellow_id, :user_id
  belongs_to :user
  belongs_to :fellow, :class_name => "User"
  
end
