class User < ActiveRecord::Base
  validates :username, :password, :acct_type, :presence => true
  validates :username, :uniqueness => true

  has_many :posts
  has_many :discussions

end
