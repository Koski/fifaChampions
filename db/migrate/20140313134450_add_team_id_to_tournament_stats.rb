class AddTeamIdToTournamentStats < ActiveRecord::Migration
  def change
  	add_column :tournament_stats, :team_id, :integer
  end
end