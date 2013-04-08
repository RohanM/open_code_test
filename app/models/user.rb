class User < ActiveRecord::Base
  validates_presence_of :nickname, :oauth_token

  attr_accessible :nickname, :oauth_token
end
