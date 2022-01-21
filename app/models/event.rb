class Event < ApplicationRecord

  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :name, presence:true
  validates :date, presence:true


  # イベント前日の通知
  def create_notification_remind_event(current_user, visited_id)
    notification = current_user.active_notifications.new(
      event_id: id,
      visited_id: visited_id,
      action: 'remind_event'
    )

    notification.save

    # 自分へは通知が作られない・届かないようにする
    # notification.save if notification.visitor_id != notification.visited_id && notification.valid?
  end


end
