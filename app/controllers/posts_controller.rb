class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    post = current_user.posts.find(params[:id])
    post.update!(post_params)
    redirect_to post_url, notice: "投稿「#{post.title}」を更新しました。"
  end

  def create
    post = current_user.posts.new(post_params)
    post.save!
    redirect_to posts_url, notice: "投稿「#{post.title}」を登録しました。"
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_url, notice: "投稿「#{post.title}」を削除しました。", status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
