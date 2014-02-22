json.array!(@castles) do |castle|
  json.extract! castle, :id
  json.url castle_url(castle, format: :json)
end
