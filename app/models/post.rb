class Post < ActiveRecord::Base
  belongs_to :blog, inverse_of: :posts
  validates :content, presence: true, length: { minimum: 20 }
  validates :blog, presence: true
end
