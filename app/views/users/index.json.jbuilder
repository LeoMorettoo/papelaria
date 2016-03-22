json.array!(@users) do |user|
  json.extract! user, :id, :name, :login, :password, :email, :cpf, :rg, :createDate, :updateDate, :comments
  json.url user_url(user, format: :json)
end
