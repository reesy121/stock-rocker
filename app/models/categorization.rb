class Categorization < ActiveRecord::Base
	 belongs_to :blog
  	 belongs_to :category

  	 accepts_nested_attributes_for :category, :reject_if => :all_blank
  	 validates_uniqueness_of :category_id, :scope => :blog_id
end
