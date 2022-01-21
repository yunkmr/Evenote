class Ticket < ApplicationRecord

  belongs_to :user

  validates :event_name, presence:true
  validates :event_date, presence:true

  # イベント前日の通知
  def create_notification_remind_entry_start(current_user, visited_id)
    current_user.active_notifications.new(
      ticket_id: id,
      visited_id: visited_id,
      action: 'remind_entry_start'
    )
    # 自分へは通知が作られない・届かないようにする
    # notification.save if notification.visitor_id != notification.visited_id && notification.valid?
  end

  # イベント前日の通知
  def create_notification_remind_entry_end(current_user, visited_id)
    current_user.active_notifications.new(
      ticket_id: id,
      visited_id: visited_id,
      action: 'remind_entry_end'
    )
    # 自分へは通知が作られない・届かないようにする
    # notification.save if notification.visitor_id != notification.visited_id && notification.valid?
  end

  # イベント前日の通知
  def create_notification_remind_win(current_user, visited_id)
    current_user.active_notifications.new(
      ticket_id: id,
      visited_id: visited_id,
      action: 'remind_win'
    )
    # 自分へは通知が作られない・届かないようにする
    # notification.save if notification.visitor_id != notification.visited_id && notification.valid?
  end

  # イベント前日の通知
  def create_notification_remind_payment(current_user, visited_id)
    current_user.active_notifications.new(
      ticket_id: id,
      visited_id: visited_id,
      action: 'remind_payment'
    )
    # 自分へは通知が作られない・届かないようにする
    # notification.save if notification.visitor_id != notification.visited_id && notification.valid?
  end



end
