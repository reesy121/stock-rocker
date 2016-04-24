class BlogsController < ApplicationController
  include BlogsHelper

  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show

  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    #@blog.posts.build
  end

  # GET /blogs/1/edit
  def edit

  end

  # blog /blogs
  # blog /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if (preview_button? && @blog.valid?)
        format.html { render :new }
      elsif @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if preview_button? || !@project.update
        @blog.assign_attributes(blog_params)
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      else @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
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

    def method_name
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
       params.require(:blog).permit(:title, :sub_title, :tags, posts_attributes: [:id, :blog_id, :content, :_destroy])
    end


end
