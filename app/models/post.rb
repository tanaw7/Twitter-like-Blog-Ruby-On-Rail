class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  has_many :comments
  belongs_to :user

  validates :user, presence: true
  validates_presence_of :user_id, :on => :create
  validates_presence_of :content, :on => :create
  validates_presence_of :title, :on => :create
  validates_presence_of :user_id, :on => :update
  validates_presence_of :content, :on => :update
  validates_presence_of :title, :on => :update

  auto_html_for :content do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

end
