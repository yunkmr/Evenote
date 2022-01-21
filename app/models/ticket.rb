class Ticket < ApplicationRecord

  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :event_name, presence:true
  validates :event_date, presence:true

  # イベント前日の通知
  def create_notification_remind_entry_start(current_user, visited_id)
    notification = current_user.active_notifications.new(
      ticket_id: id,
      visited_id: visited_id,
      action: 'remind_entry_start'
    )
    notification.save
  end

  # イベント前日の通知
  def create_notification_remind_entry_end(current_user, visited_id)
    notification = current_user.active_notifications.new(
      ticket_id: id,
      visited_id: visited_id,
      action: 'remind_entry_end'
    )
    notification.save
  end

  # イベント前日の通知
  def create_notification_remind_win(current_user, visited_id)
    notification = current_user.active_notifications.new(
      ticket_id: id,
      visited_id: visited_id,
      action: 'remind_win'
    )
    notification.save
  end

  # イベント前日の通知
  def create_notification_remind_payment(current_user, visited_id)
    notification = current_user.active_notifications.new(
      ticket_id: id,
      visited_id: visited_id,
      action: 'remind_payment'
    )
    notification.save
  end

end
