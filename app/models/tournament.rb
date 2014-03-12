class Tournament < ActiveRecord::Base
	has_many :tournament_stats
	has_many :users, through: :tournament_stats
end
