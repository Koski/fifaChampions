class Team < ActiveRecord::Base
	has_many :tournament_stats
end
