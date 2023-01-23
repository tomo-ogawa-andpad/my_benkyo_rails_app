class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    post = Post.new(post_params)
    post.save!
    redirect_to posts_url, notice: "投稿「#{post.title}」を登録しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
