class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :release_flg, :boolean, default: false, null: false
  end
end
