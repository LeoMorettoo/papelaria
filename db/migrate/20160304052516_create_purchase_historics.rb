class CreatePurchaseHistorics < ActiveRecord::Migration
  def change
    create_table :purchase_historics do |t|
      t.references :client, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.datetime :createDate
      t.boolean :paidStatus
      t.decimal :discount, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
