class PostsController < ApplicationController

#include AutoHtml

	def index

		if current_user
			@posts = Post.last(8)
			#@user = User.find(session(:user_id))
			#@posts = Post.all
		else
			@posts = Post.where(:user_id => nil)
		end
	end

	def feed
		if current_user
			@fellows = Fellowship.where(:user_id => current_user.id)
			@posts = Post.all
			#@user = User.find(session(:user_id))
			#@posts = Post.all
		else
			@posts = Post.where(:user_id => nil)
		end	
	end

	def userposts
		if current_user
			@fellows = Fellowship.where(:user_id => current_user.id)
			@posts = Post.where(:user_id => current_user.id)
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
		if current_user
			@cu = current_user.id
		else
			@cu = 0
		end		
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new(params[:content])
		@comments = Comment.where(:post_id => @post.id)
		@user = User.find(Post.find(params[:id]).user_id)
	end

	def create
		@post = Post.new(params[:post])

		if @post.save
			redirect_to "/userposts", :notice => "Your post was saved"
		else
			render "new"
		end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to "/userposts", :notice => "Your post has been updated"
		else
			render "edit"
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to "/userposts", :notice => "Your post has been deleted"
	end

	############### additional methods #################

	def comment

	end
end
