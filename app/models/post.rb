class Post < ApplicationRecord
  belongs_to :user
  scope :recent, -> { order(created_at: :desc) }
  scope :created_day, -> (day){ where(created_at: day.beginning_of_day..day.end_of_day) }
end
