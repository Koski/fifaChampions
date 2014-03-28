class Team < ActiveRecord::Base
	has_many :tournament_stats
	has_many :contracts
	has_many :players, through: :contracts
	validates :name, uniqueness: true, length: {minimum: 3, maximum: 50}

	def self.teams_alphabetically
		Team.all.sort_by(&:name)
	end
end
