class Admin::UsersSummariesController < Admin::ApplicationController

  def index
    @users_summaries = UsersSummary.preload(:file_blob).order(created_at: :desc)
  end

  def create
    UsersSummaryGenerateJob.perform_later(Time.zone.today)
    redirect_back fallback_location: root_path, notice: "ダウンロードを受け付けました。「ダウンロードした投稿サマリの一覧」からご確認ください。"
  end
end
