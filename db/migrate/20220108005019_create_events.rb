class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.references :user, foreign_key: true
      t.string :name
      t.date :date
      t.time :open_time
      t.time :start_time
      t.time :end_time
      t.string :artist
      t.string :place
      t.string :seat
      t.string :with
      t.text :memo
      t.boolean :release_flg, :boolean, default: false, null: false

      t.timestamps
    end
  end
end
