class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :password, :presence => true, :length => {:minimum => 6}, :on => :create
  validates :name, :presence => true, :length => {:in => 2..30}
  before_save { email.downcase! }
  has_secure_password
end
