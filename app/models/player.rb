class Player < ActiveRecord::Base
	has_many :contracts
	has_many :teams, through: :contracts

	def self.players_alphabetically
		Player.all.sort_by(&:name)
	end
end
