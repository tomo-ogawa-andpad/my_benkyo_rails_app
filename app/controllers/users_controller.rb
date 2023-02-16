class UsersController < ApplicationController
  before_action :current_user_check

  def show
    @posts = current_user.posts.created_today
  end

  private

  def current_user_check
    @user = User.find(params[:id])
    redirect_to root_url if @user != current_user && !current_user.admin
  end
end