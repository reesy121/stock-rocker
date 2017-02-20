class BlogsController < ApplicationController
  include BlogsHelper

  impressionist :actions => [:show]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @blogs = Blog.all
  end

  def show
    @comments = @blog.comments.order_all
  end

  def new
    @blog = Blog.new
    # Only build on new and invalid
    @blog.posts.build && @blog.categorizations.build unless performed?
  end

  def edit
  end

  def create
    @blog = current_user.blogs.new(blog_params)
      if (preview_button? && @blog.valid?)
        render :new
      elsif @blog.save
        redirect_to @blog, notice: 'Blog was successfully created.'
      else
        clear_preview_button
        render :new
      end
  end

  def update
      if (preview_button? && @blog.valid?)
        @blog.assign_attributes(blog_params)
        render :edit
       elsif @blog.update(blog_params)
        redirect_to @blog, notice: 'Blog was successfully updated.'
       else
        clear_preview_button
        render :edit
      end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
       params.require(:blog).permit(:title, :sub_title, :tags, :user_id, posts_attributes: [:id, :blog_id, :content, :_destroy],
                      categorizations_attributes: [:id, :_destroy, :category_id, category_attributes: [:id, :_destroy, :name]])
    end


end
