json.array!(@words) do |word|
  json.extract! word, :id, :namelanguage1, :namelanguage2, :member_id, :language1_id, :language2_id, :tags
  json.url word_url(word, format: :json)
end
