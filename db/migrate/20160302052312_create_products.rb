class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 50
      t.text :description, null: true
      t.decimal :value, precision: 10, scale: 2
      t.integer :quantity
      t.decimal :discount, precision: 10, scale: 2
      t.decimal :profit, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
