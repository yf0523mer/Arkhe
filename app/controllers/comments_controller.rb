class CommentsController < ApplicationController
	def create
		post = Post.find(params[:post_id])
	    comment = current_user.comments.new(comment_params)
	    comment.post_id = post.id
	    comment.save
	    redirect_to post_path(params[:post_id])
	end

	def comment_params
  		params.require(:comment).permit(:user_id, :post_id, :comment)
	end
end
