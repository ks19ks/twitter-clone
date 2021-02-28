class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Posted!'
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
