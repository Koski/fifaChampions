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
		#tournament_stats.all.select{|t| t.standing == 1}.count ## oli ennen näin. rumaa :p
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
		return [self,0] if tournament_stats.count == 0 
		[self, number_of_standings(1) / tournament_stats.count.to_f]
	end

	def self.users_by_win_ratio(n)
		User.all.map(&:win_ratio).sort {|a,b| b[1] <=> a[1] }[0..n]
	end



	def number_of_tournaments
		tournament_stats.count
	end

end