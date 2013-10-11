class User < ActiveRecord::Base
  validates :username, :password, :acct_type, :presence => true
  validates :username, :uniqueness => true
end
