class Category < ActiveRecord::Base
	has_many :categorizations
    has_many :blogs, through: :categorizations
    validates :name, presence: true, length: { maximum: 55 }

    def self.has_blogs
  	 	all.joins(:categorizations).order('name ASC')
  	end
end
