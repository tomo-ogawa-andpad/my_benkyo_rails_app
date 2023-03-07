class MypageController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts.created_at_this_month(Time.zone.today)
  end
end