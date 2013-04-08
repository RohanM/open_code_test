class User < ActiveRecord::Base
  validates :nickname, :presence => true, :uniqueness => true
  validates :oauth_token, :presence => true

  attr_accessible :nickname, :oauth_token
end
