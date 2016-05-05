class CommentsController < ApplicationController

	#before_action :confirm_user

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		if @comment.save
			flash[:notice] = "Your comment was successfully created"
			redirect_to @comment.blog
		else
			flash[:notice] = "Your comment couldn't be created"
			render 'new'
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy

		redirect_to @comment.blog
	end

  private

    def comment_params
    	params.require(:comment).permit(:content, :blog_id)
    end

end