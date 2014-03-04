class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  	validates :username, uniqueness: true, 
		 				length: {minimum: 3, maximum: 15} 				
end
