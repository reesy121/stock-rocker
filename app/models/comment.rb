class Comment < ActiveRecord::Base
	belongs_to :blog
	belongs_to :user

	validates :content, presence: true, length: { maximum: 255, minimum: 5 }
	validates :blog, presence: true
	validates :user, presence: true

	def self.order_all
		all.order(created_at: :desc)
	end
end
