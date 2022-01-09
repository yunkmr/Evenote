class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|

      t.references :album, foreign_key: true
      t.string :memory_image_id

      t.timestamps
    end
  end
end
