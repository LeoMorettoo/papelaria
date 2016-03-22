class AddValueOfSellToPurchaseHistoric < ActiveRecord::Migration
  def change
  	add_column :purchase_historics, :value_of_sell, :decimal
  end
end
