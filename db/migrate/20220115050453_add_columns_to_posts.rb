class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :maintext, :text
  end
end
