class Player < ActiveRecord::Base
	has_many :contracts
	has_many :teams, through: :contracts

	validates :name, uniqueness: true, length: {minimum: 3, maximum: 50}
	validates :number, presence: true

	def self.players_alphabetically
		Player.all.sort_by(&:name)
	end
end
