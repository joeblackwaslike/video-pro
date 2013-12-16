json.array!(@videos) do |video|
  json.extract! video, :video_key
  json.url video_url(video, format: :json)
end