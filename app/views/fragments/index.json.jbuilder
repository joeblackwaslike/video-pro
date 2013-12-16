json.array!(@fragments) do |fragment|
  json.extract! fragment, :key, :language, :content
  json.url fragment_url(fragment, format: :json)
end