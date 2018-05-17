class AddToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :ukuran, :string
  	add_column :products, :warna, :string
  end
end
