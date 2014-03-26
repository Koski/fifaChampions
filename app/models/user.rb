class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	has_many :tournament_stats
	has_many :tournaments, through: :tournament_stats
	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}

	def number_of_wins
		tournament_stats.all.select{|t| t.standing == 1}.count
	end
	
	def number_of_losses(id)

		tournament_stats.loser_stats#.select{|s| s.user_id==id}.count
	end

end