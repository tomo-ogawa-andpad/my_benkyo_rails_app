class Admin::UsersSummariesController < ApplicationController
  before_action :require_admin

  include Admin::AdminCommonController

  def index
    @users_summaries = UsersSummary.preload(:file_blob).order(created_at: :desc)
  end

  def create
    UsersSummaryDownloadJob.perform_now
    redirect_back fallback_location: root_path
  end
end