class UsersSummaryDownloadJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.all
    today = Time.zone.today
    month = today.month
    year = today.year
    filename = "#{year}年#{month}月の投稿サマリ.csv"
    CSV.open(filename, 'w', encoding: 'sjis') do |csv|
      csv << ['ユーザー名', "投稿数"]
      users.each do |user|
        csv << [user.name, user.posts.created_at_this_month(today).size]
      end
    end
    user_summary = UsersSummary.create!
    user_summary.file.attach(io: File.open(filename), filename: filename)
  end
end