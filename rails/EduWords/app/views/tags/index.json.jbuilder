json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :language_member_id, :member_id
  json.url tag_url(tag, format: :json)
end
