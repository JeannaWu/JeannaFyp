class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post, only: :create
	before_action :paneluser, only: :approve
	def create
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user = current_user
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
	
	def destroy
		@comment = @post.comments.find(params[:id]).destroy
		redirect_to posts_url
	end
	def upvote
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.upvote_by current_user
		redirect_to :back
	end
	def downvote
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.downvote_by current_user
		redirect_to :back
	end
	def approve
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.update_attribute(:approved_at, Time.now)
		redirect_to :back
	end
	def agree
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.approval_votes.create
		redirect_to :back
	end
	def disagree
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.approval_downvotes.create
		redirect_to :back
	end

	private
	def find_post
		@post = Post.find(params[:post_id])
	end
	def paneluser
    	redirect_to(root_path) unless current_user.paneluser?
    end
end
