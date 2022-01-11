module NotificationsHelper

  # 通知を確認したか
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
