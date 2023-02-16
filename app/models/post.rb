class Post < ApplicationRecord
  belongs_to :user
  scope :recent, -> { order(created_at: :desc) }
  scope :created_today, -> { where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day) }
end
