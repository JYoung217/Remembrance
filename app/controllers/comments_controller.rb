class CommentsController < ApplicationController
  include ApplicationHelper
  def create
    current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.update(commenter: @current_user)
    redirect_to user_path(Memorial.find(@post.memorial_id))
  end

  def new
    @comment = Comment.new
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :text)
    end
end
