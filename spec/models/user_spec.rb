require 'spec_helper'

describe User do

	let!(:user){ FactoryGirl.create(:user) }
	let!(:user_2) {FactoryGirl.create(:user, username: "mr. 2")}
	let!(:tournament_1) { FactoryGirl.create(:tournament) }
	let!(:tournament_2) { FactoryGirl.create(:tournament, name:"Challenge Cup") }
	# let!(:tournament_3) { FactoryGirl.create(:tournament, name:"Community Shield") }
	let!(:tournament_stat_1) { FactoryGirl.create(:tournament_stat,tournament: tournament_1, user:user, standing: 1) }
	# let!(:tournament_stat_2) { FactoryGirl.create(:tournament_stat,tournament: tournament_1, user:user_2, standing: 2) }
	let!(:tournament_stat_3) { FactoryGirl.create(:tournament_stat,tournament: tournament_2, user:user, standing: 2) }
	let!(:tournament_stat_4) { FactoryGirl.create(:tournament_stat,tournament: tournament_2, user:user_2, standing: 1) }
	

	it "is valid with long enough password, email and username" do
		expect(user).to be_valid
	end

	it "is not valid with too short password" do
		user = FactoryGirl.build(:user, password: "nope")
		expect(user).not_to be_valid
	end

	it "is not valid with too short username" do
		user = FactoryGirl.build(:user, username: "k")
		expect(user).not_to be_valid
	end

	it "is not valid with improper email" do
		user = FactoryGirl.build(:user, email: "s")
		expect(user).not_to be_valid
	end

	it "should have correct amount of standings when tournaments are added" do
		expect(user.number_of_wins).to be(1)
		expect(user.number_of_standings(2)).to be(1)
	end

	it "should have correct amount of losses when tournaments are added" do
		expect(user.number_of_losses).to be(1)

		# stat_5 = FactoryGirl.create(:tournament_stat, tournament: tournament_3, user: user_2, standing:1)
		# stat_6 = FactoryGirl.create(:tournament_stat, tournament: tournament_3, user: user, standing:2)
		# expect(user.number_of_losses).to be(2)
	end

end
