class Admin::UsersController < ApplicationController
  before_action :require_admin

  include Admin::AdminCommonController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}を削除しました。"
  end

  def summary_download
    users = User.all
    today = Time.zone.today
    month = today.month
    year = today.year
    csv_data = CSV.generate(encoding: 'sjis') do |csv|
      csv << ['ユーザー名', "投稿数"]
      users.each do |user|
        csv << [user.name, user.posts.created_at_this_month(today).size]
      end
    end
    send_data(csv_data, filename: "#{year}年#{month}月の投稿サマリ.csv")
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
