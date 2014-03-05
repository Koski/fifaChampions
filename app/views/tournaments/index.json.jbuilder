json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name
  json.url tournament_url(tournament, format: :json)
end
