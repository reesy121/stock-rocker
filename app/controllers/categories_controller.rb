class CategoriesController < ApplicationController
 include BlogsHelper

	def show
		@category = Category.find(params[:id])
		@blogs = @category.blogs
	end

	def index
		@categories = Category.has_blogs
	end
end
