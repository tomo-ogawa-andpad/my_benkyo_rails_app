class Admin::UsersSummariesController < Admin::ApplicationController

  def index
    @users_summaries = UsersSummary.preload(:file_blob).order(created_at: :desc)
  end

  def create
    UsersSummaryGenerateJob.perform_later(Time.zone.today)
    redirect_back fallback_location: root_path, notice: "投稿サマリの作成を受け付けました。「作成した投稿サマリの一覧」からダウンロードしてください。"
  end
end
