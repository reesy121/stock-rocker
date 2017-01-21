class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			flash[:notice] = "Your comment was successfully created"
			redirect_to @blog
		else
			flash[:danger] = "Your comment couldn't be created."
			@comments = @blog.comments.order_all
			render "blogs/show" #try and render so fake data is still in there?
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy if @comment.user == current_user

		flash[:notice] = "Your comment was deleted! Hope it wasn't naughty"
		redirect_to @comment.blog
	end

  private

    def comment_params
    	params.require(:comment).permit(:content, :blog_id, :user_id)
    end

end