class PostsController < ApplicationController
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

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new(params[:content])
		@comments = Comment.where(:post_id => @post.id)
	end

	def create
		@post = Post.new(params[:post])

		if @post.save
			redirect_to posts_path, :notice => "Your post was saved"
		else
			render "new"
		end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to posts_path, :notice => "Your post has been updated"
		else
			render "edit"
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path, :notice => "Your post has been deleted"
	end

	############### additional methods #################

	def comment

	end
end
