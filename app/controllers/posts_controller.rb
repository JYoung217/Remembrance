include PostsHelper

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    current_user
    if @current_user
      new_post = Post.create(post_params)
      new_post.save
      redirect_to post_path(Memorial.find(new_post.post_id))
    else
      redirect_to root_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:text)
    end

end
