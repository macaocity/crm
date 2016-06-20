json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :chinese_first_name, :chinese_last_name, :nick_name, :occupation, :title
  json.url contact_url(contact, format: :json)
end
