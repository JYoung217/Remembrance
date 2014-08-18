class CommentsController < ApplicationController
  include ApplicationHelper

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    current_user
    @memorial = Memorial.find(params[:memorial_id])
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      @comment.update(commenter: @current_user)
    elsif params[:photo_id]
      @photo = Photo.find(params[:photo_id])
      @comment = @photo.comments.create(comment_params)
      @comment.update(commenter: @current_user)
    end
    redirect_to memorial_path(@memorial)
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      @memorial = Memorial.find(params[:memorial_id])
      redirect_to memorial_path(@memorial)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @memorial = Memorial.find(params[:memorial_id])
    redirect_to memorial_path(@memorial)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :commentable, :text)
    end
end