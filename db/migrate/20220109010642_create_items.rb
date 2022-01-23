class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.references :event, foreign_key: true
      t.string :name
      t.integer :quantity
      t.integer :price
      t.boolean :buy_flg, default: false, null: false

      t.timestamps
    end
  end
end
