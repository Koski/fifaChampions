class CreateTournamentStats < ActiveRecord::Migration
  def change
    create_table :tournament_stats do |t|
      t.integer :user_id
      t.integer :tournament_id
      t.integer :standing

      t.timestamps
    end
  end
end
