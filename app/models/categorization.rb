class Categorization < ActiveRecord::Base
	 belongs_to :blog#, inverse_of: :categorization
  	 belongs_to :category

  	 #validates :category_id, presence: :true
  	 accepts_nested_attributes_for :category, :reject_if => :all_blank
  	 validates_uniqueness_of :category_id, :scope => :blog_id
end
