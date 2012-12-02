class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_id

  belongs_to :post
  belongs_to :user

  validates :user, presence: true
  validates_presence_of :user_id, :on => :create
  validates_presence_of :content, :on => :create
end
