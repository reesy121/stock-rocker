class Blog < ActiveRecord::Base
	is_impressionable
	belongs_to :user
	#
	has_many :posts, dependent: :destroy, inverse_of: :blog
	has_many :comments, dependent: :destroy
	has_many :categorizations, dependent: :destroy
  	has_many :categories, :through => :categorizations, :class_name => 'Category'
  	#
  	accepts_nested_attributes_for :categories
  	accepts_nested_attributes_for :categorizations
  	accepts_nested_attributes_for :posts, allow_destroy: true, limit: 5, reject_if: proc { |attributes| attributes['content'].blank? }
  	#
	validates_associated :posts
	validates :title, presence: true, length: { maximum: 55, minimum: 5 }
	validates :sub_title, length: { maximum: 55 }, allow_blank: true
	validates :tags, presence: true,  length: { maximum: 120, minimum: 5 }
	validates :posts, presence: true
	validates :user, presence: true
	validates :categorizations, presence: true
	
	def unique_views
		impressionist_count(:filter=>:ip_address)
	end
end
