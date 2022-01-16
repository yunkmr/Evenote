class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(2).order(created_at: :desc)

    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end

    @notifications = @notifications.where.not(visitor_id: current_user.id)

    if params[:page].present?
      render 'pagenate.js.erb'
    else
      render 'index.js.erb'
    end
    # binding.pry
  end

end
