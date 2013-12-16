json.array!(@users) do |user|
  json.extract! user, :email, :name, :access_level, :password
  json.url user_url(user, format: :json)
end