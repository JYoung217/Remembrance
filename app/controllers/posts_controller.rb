include PostsHelper

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    current_user
    @user = current_user
    @author = Post.find(params[:author_id])
    @memorial = Memorial.find(params[:memorial_id])
    @new_post = @memorial.posts.create(author_id: current_user.id, text: params[:post][:text])
    # redirect_to memorial_path(@author)
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:text)
    end

end
