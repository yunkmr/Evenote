class AddWithToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :with, :string
  end
end
