json.array!(@purchase_historics) do |purchase_historic|
  json.extract! purchase_historic, :id, :client_id, :product_id, :quantity, :createDate, :paidStatus, :discount
  json.url purchase_historic_url(purchase_historic, format: :json)
end
