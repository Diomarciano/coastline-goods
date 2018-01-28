class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|
      t.integer :owner_id
      t.string :owner_type
      t.integer :quantity
      t.integer :item_id
      t.string :item_type
      t.string :price_currency
      t.decimal :price_cents

      t.timestamps null: false
    end
  end
end
