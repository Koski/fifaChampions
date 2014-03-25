class TournamentStat < ActiveRecord::Base
	belongs_to :user
	belongs_to :tournament
	belongs_to :team

	def self.users_by_wins(n)
		users_with_most_wins = TournamentStat.all.select{|u| u.standing ==1}.group_by{|u| u.user}.to_a.map{|u| u[0]}
		users_with_most_wins.take(n)
	end

	def self.most_recent_winner
		TournamentStat.all.select{|u| u.standing ==1}.last.user
	end

	def self.users_by_losses
		retStats = []
		Tournament.all.each do |t|
			retStats.push(t.tournament_stats.last)
		end
		#TournamentStat.users_by_losses.group_by{|s| s.user}.to_a.map{|k| k[0] }
		return retStats
	end

end
