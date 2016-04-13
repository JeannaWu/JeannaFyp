 class PostsController < ApplicationController
 	
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :approve, :agree]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :paneluser, only: :approve
	def index
		if user_signed_in?
			@category = Category.all
			if params[:category].blank?
				@posts = Post.where(["title LIKE ?","%#{params[:search]}%"]).paginate(page: params[:page], per_page: 30)
			else
				@category_id = Category.find_by(name: params[:category]).id
				@posts = Post.where(category_id: @category_id).paginate(page: params[:page], per_page: 30).order("created_at DESC")
			end
		
		end
	end

	def show
		@user = @post.user
		@image = @post.image
		@category = @post.category
		@comments = Comment.where(post_id: @post).paginate(page: params[:page], per_page: 30)
		@random_post = Post.where.not(id: @post).order("RAND()").first
	end
	
	def new
		@post = current_user.posts.build
	end
	
	def create

		@post = current_user.posts.build(post_params)
		
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def approve
		@post = Post.find(params[:id])
		@post.update_attribute(:approved_at, Time.now)
		redirect_to root_path
	end
	def edit
		
	end
	
	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post deleted"
		redirect_to @post
	end
	def upvote
		@post.upvote_by current_user
		redirect_to :back
	end
	def downvote
		@post.downvote_by current_user
		redirect_to :back
	end
	def agree	
		@post.approval_votes.create
  		redirect_to :back
	end
	def disagree	
		@post.approval_downvotes.create
		redirect_to :back
	end
	
	
	private
	
	def find_post
		@post = Post.find(params[:id])
	end
    def paneluser
    	redirect_to(root_path) unless current_user.paneluser?
    end
	def post_params
		params.require(:post).permit(:title, :content, :image, :category_id)
	end
	
end
