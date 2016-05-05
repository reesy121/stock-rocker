class Post < ActiveRecord::Base
  belongs_to :blog, inverse_of: :posts, dependent: :destroy
  validates :content, presence: true, length: { minimum: 20 }
end
