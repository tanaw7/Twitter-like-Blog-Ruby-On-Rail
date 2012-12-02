class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  has_many :comments
  belongs_to :user

  validates :user, presence: true
  validates_presence_of :user_id, :on => :create
  validates_presence_of :content, :on => :create
  validates_presence_of :title, :on => :create

end
