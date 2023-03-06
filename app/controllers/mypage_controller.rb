class MypageController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts.created_today
  end
end