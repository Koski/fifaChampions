class TournamentStat < ActiveRecord::Base
	belongs_to :user
	belongs_to :tournament
	belongs_to :team

	def self.most_recent_winner
		return nil if TournamentStat.all.empty?
		TournamentStat.all.select{|u| u.standing ==1}.last.user
	end

end
