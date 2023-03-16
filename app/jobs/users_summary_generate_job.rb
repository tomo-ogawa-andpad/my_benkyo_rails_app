class UsersSummaryGenerateJob < ApplicationJob
  queue_as :default

  def perform(today)
    users = User.all
    month = today.month
    year = today.year
    filename = "#{year}年#{month}月の投稿サマリ.csv"
    csv_data = CSV.generate(encoding: 'sjis') do |csv|
      csv << ['ユーザー名', "投稿数"]
      users.each do |user|
        csv << [user.name, user.posts.created_at_this_month(today).size]
      end
    end
    UsersSummary.create!.file.attach(io: StringIO.new(csv_data), filename: filename)
  end
end
