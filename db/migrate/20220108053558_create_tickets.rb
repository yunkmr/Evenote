class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|

      t.integer :user_id
      t.integer :event_id
      t.string :event_name
      t.date :event_date
      t.integer :number
      t.integer :money
      t.date :entry_start_date
      t.date :entry_end_date
      t.boolean :entry_flg
      t.date :win_date
      t.boolean :win_flg
      t.date :payment_date
      t.boolean :payment_flg

      t.timestamps
    end
  end
end
