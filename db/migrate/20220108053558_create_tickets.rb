class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|

      t.references :user, foreign_key: true
      t.string :event_name
      t.date :event_date
      t.integer :number
      t.integer :money
      t.date :entry_start_date
      t.date :entry_end_date
      t.boolean :entry_flg, default: false, null: false
      t.date :win_date
      t.boolean :win_flg
      t.date :payment_date
      t.boolean :payment_flg, default: false, null: false

      t.timestamps
    end
  end
end
