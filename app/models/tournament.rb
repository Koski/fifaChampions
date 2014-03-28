class Tournament < ActiveRecord::Base
	has_many :tournament_stats
	has_many :users, through: :tournament_stats

	validates :name, uniqueness: true, length: {minimum: 3, maximum: 15}
	
	accepts_nested_attributes_for :tournament_stats

	validate :check_duplicate_stats, on: :create

	def check_duplicate_stats
		contains_duplicate :team_id
		contains_duplicate :user_id
	end

	def contains_duplicate(id)
		ids = tournament_stats.collect{|stat| stat[id]}
		if ids.uniq.length != ids.length
			errors.add(id, 'has to be unique')
		end
	end

end
