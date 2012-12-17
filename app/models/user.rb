class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessor :password

  has_many :posts
  has_many :comments

  before_save :encrypt_password



  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  #validates_presence_of :email
  #validates_uniqueness_of :email
  
  def self.authenticate(email, password)
  user = find_by_email(email)
  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
  else
    nil
  end
end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end



##### FOR FACEBOOK ##############

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = 'fb1234'
      user.password_confirmation = 'fb1234'
      user.save!
    end
  end

end


