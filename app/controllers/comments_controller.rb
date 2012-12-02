class CommentsController < ApplicationController

	def index
		if current_user
			@posts = User.find(session[:user_id]).posts
			#@user = User.find(session(:user_id))
			#@posts = Post.all
		else
			@posts = Post.where(:user_id => nil)
		end
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(params[:comment])

		if @comment.save
			redirect_to posts_path, :notice => "Your comment was saved"
		else
			render "new", :notice => "Try again"
		end
	end

end
