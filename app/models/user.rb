class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	has_many :tournament_stats
	has_many :tournaments, through: :tournament_stats
	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}

	def number_of_standings(n)
		self.tournament_stats.where(standing: n).count
	end

	def number_of_wins
		number_of_standings(1)
	end

	def number_of_losses
		losses = 0
		tournament_stats.each do |s|
			losses += 1 if s.tournament.tournament_stats.last.id == s.id		
		end
		return losses
	end

	def win_ratio
		return 0.0 if tournament_stats.count == 0
		(number_of_standings(1) / tournament_stats.count.to_f)*100
	end

	def self.users_by_win_ratio(n)
		users_by(:win_ratio,n)
	end

	def self.users_by(id,n)
		User.all.sort { |a,b| b.send(id) <=> a.send(id) }.take(n)
	end

	def number_of_tournaments
		tournament_stats.count
	end

	def point_ratio
		return 0.0 if tournament_stats.count == 0
		ratio = 0.to_f
		tournament_stats.each do |s|
			available = ((s.tournament.tournament_stats.count-1) * 3)
			ratio += s.points / available.to_f
		end
		return (ratio/tournament_stats.count).round(2) *100
	end

	def self.alphabetically
		User.all.sort_by(&:username)
	end
end