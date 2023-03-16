class Admin::UserpageController < Admin::ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.created_at_this_month(Time.zone.today)
    render template: 'mypage/show'
  end
end
