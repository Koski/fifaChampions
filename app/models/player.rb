class Player < ActiveRecord::Base
	has_many :contracts
	has_many :teams, through: :contracts
end
