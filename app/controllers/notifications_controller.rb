class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications

    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end

    # @notifications = @notifications.where(visited_id: current_user.id).page(params[:page]).per(10).order(created_at: :desc)
    @notifications = @notifications.where(visited_id: current_user.id).order(created_at: :desc)

    render 'index.js.erb'

    # if params[:page].present?
    #   render 'pagenate.js.erb'
    # else
    #   render 'index.js.erb'
    # end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    @notifications = current_user.passive_notifications
    @notifications = @notifications.where(visited_id: current_user.id).order(created_at: :desc)

    render 'index.js.erb'

    # if params[:page].present?
    #   render 'pagenate.js.erb'
    # else
    #   render 'index.js.erb'
    # end
  end

end
