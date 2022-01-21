class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications

    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end

    @notifications = @notifications.where(visited_id: current_user.id).page(params[:page]).per(10).order(created_at: :desc)
    # @notifications = @notifications

    if params[:page].present?
      render 'pagenate.js.erb'
    else
      render 'index.js.erb'
    end
  end

end
