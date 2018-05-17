class CreateKonfirms < ActiveRecord::Migration
  def change
    create_table :konfirms do |t|
      t.string :no_order
      t.string :no_rek
      t.string :atas_nama
      t.decimal :jumlah
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
