class AddIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :event_id, :integer
    add_column :notifications, :ticket_id, :integer
    add_index :notifications, :event_id
    add_index :notifications, :ticket_id
  end
end
