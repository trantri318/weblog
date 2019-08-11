class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
    flash[:success] = "Register success"
    redirect_to posts_path
    else
    flash[:success] = "Register failed"
    render :new
    end
  end

  private
  def post_params
    params.require(:post).permit :title, :description, :image, :price, :category_id
  end
end
