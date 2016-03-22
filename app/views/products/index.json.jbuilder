json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :value, :quantity, :discount, :profit
  json.url product_url(product, format: :json)
end
