class ChangeDataMemoryImageIdToPhoto < ActiveRecord::Migration[5.2]
  def change
    change_column :photos, :memory_image_id, :text
  end
end
