class Blog < ActiveRecord::Base
	has_many :posts, dependent: :destroy, inverse_of: :blog
	validates_associated :posts
	accepts_nested_attributes_for :posts, allow_destroy: true, limit: 8, reject_if: proc { |attributes| attributes['content'].blank? }
	validates :title, presence: true, length: { maximum: 55, minimum: 5 }
	validates :sub_title, length: { maximum: 55 }, allow_blank: true
	validates :tags, presence: true,  length: { maximum: 120, minimum: 4 }
	validates :posts, presence: true
end
