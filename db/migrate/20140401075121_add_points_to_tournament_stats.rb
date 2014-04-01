class AddPointsToTournamentStats < ActiveRecord::Migration
  def change
  	add_column :tournament_stats, :points, :integer
  end
end
