json.array!(@tournament_stats) do |tournament_stat|
  json.extract! tournament_stat, :id, :user_id, :tournament_id, :standing
  json.url tournament_stat_url(tournament_stat, format: :json)
end
