class User < ActiveRecord::Base
  validates :username, :password_hash, :acct_type, :presence => true
  validates :username, :uniqueness => true

  has_many :posts
  has_many :discussions

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
