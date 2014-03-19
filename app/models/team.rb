class Team < ActiveRecord::Base
	has_many :tournament_stats
	has_many :contracts
	has_many :players, through: :contracts
	validates :name, uniqueness: true, length: {minimum: 3, maximum: 50}
end
