class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.string :album_name

      t.timestamps
    end
  end
end
