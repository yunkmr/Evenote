class RenameCommentIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :comment_id, :post_comment_id
  end
end
