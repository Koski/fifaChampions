require 'spec_helper'

describe User do

	let!(:user){ FactoryGirl.create(:user) }
	let!(:user_2) {FactoryGirl.create(:user, username: "mr. 2")}
	let!(:gft) {FactoryGirl.create(:team, name: "Golden Futsal Team")}
	let!(:eps) {FactoryGirl.create(:team, name: "Espoon Palloseura")}
	let!(:ydin) {FactoryGirl.create(:team, name: "Gft - Ydin")}
	let!(:tournament_1) { FactoryGirl.build(:tournament, name:"Bouvier Cup") }
	let!(:tournament_2) { FactoryGirl.build(:tournament, name:"Challenge Cup") }
	let!(:tournament_3) { FactoryGirl.build(:tournament, name:"Community Shield") }
	let!(:tournament_stat_1) { FactoryGirl.create(:tournament_stat,tournament: tournament_1, user:user, standing: 1, team: gft, points: 3) }
	let!(:tournament_stat_2) { FactoryGirl.create(:tournament_stat,tournament: tournament_1, user:user_2, standing: 2, team: eps, points: 0) }
	let!(:tournament_stat_4) { FactoryGirl.create(:tournament_stat,tournament: tournament_2, user:user_2, standing: 1, team: gft, points: 3) }
	let!(:tournament_stat_3) { FactoryGirl.create(:tournament_stat,tournament: tournament_2, user:user, standing: 2, team: eps, points: 0) }
	# let!(:s) { FactoryGirl.create(:tournament_stat, tournament: tournament_3, user: user_2, standing:1, team: ydin) }
	# let!(:k) {FactoryGirl.create(:tournament_stat, tournament: tournament_3, user: user, standing:2, team: eps)}

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

	it "should have correct win ratio when tournaments are added " do
		expect(user.win_ratio.round(0)).to be(50)
		temp_stat = FactoryGirl.create(:tournament_stat, tournament: tournament_3, user: user_2, standing:1, team: ydin, points: 3)
		temp_stat_2 = FactoryGirl.create(:tournament_stat,tournament: tournament_3, user:user, standing: 2, team: eps, points: 0)
		expect(user_2.win_ratio.round(0)).to be(67)
	end

	it "should have correct amount of tournaments" do
		expect(user.number_of_tournaments).to be(2)
		temp_stat = FactoryGirl.create(:tournament_stat, tournament: tournament_3, user: user, standing:1, team: ydin, points: 3)
		expect(user.number_of_tournaments).to be(3)
	end

	it "should have point ratio correct when tournaments are added" do
		expect(user.point_ratio.round(0)).to be(50)

	end

end
