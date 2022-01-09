class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :event_id
      t.string :name
      t.integer :quantity
      t.integer :price
      t.boolean :buy_flg, default: false, null: false

      t.timestamps
    end
  end
end
