require 'spec_helper'

describe Tournament do
	
	let(:tournament){ FactoryGirl.create(:tournament) }


	it "should be valid with proper name" do
		expect(tournament).to be_valid
	end

	it "should not be valid with too short name" do
		tournament = FactoryGirl.build(:tournament, name: "k")
		expect(tournament).not_to be_valid
	end

	it "should be valid with two different stats" do
		tournament = FactoryGirl.build(:tournament)
		tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat))
		tournament.tournament_stats.push(FactoryGirl.create(:tour_stat))
		expect(tournament).to be_valid
	end

	it "should not be valid with identical stats" do
		tournament = FactoryGirl.build(:tournament_ramrod)
		expect(tournament).to be_valid
		tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat))
		tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat))
		expect(tournament).not_to be_valid
	end

	it "should not be valid with stats containing same user" do
		tournament = FactoryGirl.build(:tournament_ramrod)
		tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat))
		tournament.tournament_stats.push(FactoryGirl.create(:tour_stat, user_id: 1))
		expect(tournament).not_to be_valid
	end

	it "should not be valid with stats containing same team" do
		tournament = FactoryGirl.build(:tournament_ramrod)
		tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat))
		tournament.tournament_stats.push(FactoryGirl.create(:tour_stat, team_id: 1))
		expect(tournament).not_to be_valid
	end

end