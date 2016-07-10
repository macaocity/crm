json.array!(@companies) do |company|
  json.extract! company, :id, :comp_name, :comp_tel, :comp_addr, :comp_country, :comp_city, :title
  json.url company_url(company, format: :json)
end
