class UsersSummaryGenerateJob < ApplicationJob
  queue_as :default

  def perform(today)
    users = User.all    
    csv_data = CSV.generate(encoding: 'sjis') do |csv|
      csv << ['ユーザー名', '対象年月', '投稿数']
      users.each do |user|
        date = (Post.minimum(:created_at) || Time.current).beginning_of_month
        while date <= today
          csv << [user.name, date.strftime('%Y年%m月'), user.posts.created_at_this_month(date).size]
          date = date.next_month
        end
      end
    end
    UsersSummary.create!.file.attach(io: StringIO.new(csv_data), filename: "ユーザの投稿サマリ.csv")
  end
end
