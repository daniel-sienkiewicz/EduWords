json.array!(@tests) do |test|
  json.extract! test, :id, :result, :date, :user_id
  json.url test_url(test, format: :json)
end
