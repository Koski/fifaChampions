class Tournament < ActiveRecord::Base
	has_many :tournament_stats
	has_many :users, through: :tournament_stats

	validates :name, uniqueness: true, length: {minimum: 3, maximum: 15}

end
