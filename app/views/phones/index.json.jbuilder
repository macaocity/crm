json.array!(@phones) do |phone|
  json.extract! phone, :id, :category, :tel
  json.url phone_url(phone, format: :json)
end
