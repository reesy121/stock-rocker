class Comment < ActiveRecord::Base
	belongs_to :blog, dependent: :destroy
	belongs_to :user, dependent: :destroy

	validates :content, presence: true, length: { maximum: 255, minimum: 5 }
end
