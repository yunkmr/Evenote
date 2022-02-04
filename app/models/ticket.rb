class Ticket < ApplicationRecord

  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :event_name, presence:true
  validates :event_date, presence:true
  validate :entry_end_date_after_entry_start_date
  def entry_end_date_after_entry_start_date
    unless entry_start_date.nil? || entry_end_date.nil?
      errors.add(:entry_end_date, 'は、申込開始日より遅い日付を入力してください。') if entry_start_date > entry_end_date
    end
  end

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
