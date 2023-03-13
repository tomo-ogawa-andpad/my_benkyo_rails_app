class Admin::UsersSummariesController < ApplicationController
  before_action :require_admin

  include Admin::AdminCommonController

  def index
    @users_summaries = UsersSummary.preload(:file_blob).order(created_at: :desc)
  end

  def create
    UsersSummaryDownloadJob.perform_later
    redirect_back fallback_location: root_path, notice: "ダウンロードを受け付けました。#{view_context.link_to 'こちら', admin_users_summaries_path}で確認してください。"
  end
end
