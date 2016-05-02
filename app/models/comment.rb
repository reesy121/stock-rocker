class Comment < ActiveRecord::Base
	belongs_to :blog
	belongs_to :user

	validates :content, presence: true, length: { maximum: 255, minimum: 5 }
end
