class Discussion < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :posts
end
