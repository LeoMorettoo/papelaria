json.array!(@clients) do |client|
  json.extract! client, :id, :name, :login, :password, :email, :cpf, :rg, :createDate, :updateDate, :comments
  json.url client_url(client, format: :json)
end
