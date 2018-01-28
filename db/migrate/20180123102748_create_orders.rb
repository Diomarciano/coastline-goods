class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.references :user, index: true, foreign_key: true
      t.decimal :total_price_items
      t.decimal :total_all_price
      t.string :receiver_name
      t.string :receiver_mobile_number
      t.string :receiver_province
      t.string :receiver_city
      t.text :receiver_address
      t.string :receiver_postal_code

      t.timestamps null: false
    end
  end
end
