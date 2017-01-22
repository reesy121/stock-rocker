class BlogsController < ApplicationController
  include BlogsHelper

  impressionist :actions=>[:show]
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

    respond_to do |format|
      if (preview_button? && @blog.valid?)
        format.html { render :new }
      elsif @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        clear_preview_button
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if (preview_button? && @blog.valid?)
        @blog.assign_attributes(blog_params)
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
       elsif @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
       else
        clear_preview_button
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully deleted.' }
      format.json { head :no_content }
    end
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
