class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.integer :user_id
      t.string :name
      t.date :date
      t.time :open_time
      t.time :start_time
      t.time :end_time
      t.string :place
      t.string :seat
      t.text :memo

      t.timestamps
    end
  end
end
