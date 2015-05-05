class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
	if user_signed_in?
	@post = Post.new
	else
	redirect_to new_user_session_path
	end
end

 def create
	@post = Post.new(post_params)
	if @post.save
		redirect_to posts_path
	else
		render 'new'
	end
end

 def edit
@post = Post.find(params[:id])
 end

def show
@post = Post.find(params[:id])
end	

def destroy
@post = Post.find(params[:id])
@post.destroy
redirect_to posts_path
end


def update
 @post = Post.find(params[:id])
 if @post.update_attributes(post_params)
  redirect_to post_path(@post.id)
 else
  render 'edit'
 end
end

 private
	def post_params
	params.require(:post).permit(:title, :body, :latitude, :longitude, :user_id)
	end
end
