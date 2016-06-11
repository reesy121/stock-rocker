class Category < ActiveRecord::Base
	  has_many :categorizations #,dependent: :destroy
    has_many :blogs, through: :categorizations
    before_save :capitalize_name

    validates :name, presence: true, length: { maximum: 55 }, uniqueness: { case_sensitive: false }

    def self.has_blogs
  	 	all.joins(:categorizations).order('name ASC')
  	end

  	def capitalize_name
  		self.name = self.name.titlecase
	end
end
