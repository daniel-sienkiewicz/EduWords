json.array!(@languages) do |language|
  json.extract! language, :id, :name, :user_id
  json.url language_url(language, format: :json)
end
