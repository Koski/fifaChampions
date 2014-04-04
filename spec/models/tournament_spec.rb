require 'spec_helper'

describe Tournament do
	before :all do
    	self.use_transactional_fixtures = false
	end

	before :each do
	    DatabaseCleaner.strategy = :truncation
	    DatabaseCleaner.start
	    @tournament = FactoryGirl.build(:tournament)
  	end

	after :each do
    	DatabaseCleaner.clean
  	end

  	after :all do
    	self.use_transactional_fixtures = true
  	end

	

	it "should be valid with proper name" do
		expect(@tournament).to be_valid
	end

	it "should not be valid with too short name" do
		@tournament.name = "k"
		expect(@tournament).not_to be_valid
	end

	 it "should be valid with two different stats" do
		@tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat))
	 	@tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat))
	 	expect(@tournament).to be_valid
	 end

	it "should not be valid with identical stats" do
		stat = FactoryGirl.create(:tournament_stat)
		@tournament.tournament_stats.push(stat)
		@tournament.tournament_stats.push(stat)
		expect(@tournament).not_to be_valid
	end

	it "should not be valid with stats containing same user" do
		user = FactoryGirl.create(:user)
		@tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat, user:user))
		@tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat, user:user))
		expect(@tournament).not_to be_valid
	end

	it "should not be valid with stats containing same team" do
		team = FactoryGirl.create(:team)
		@tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat, team:team))
		@tournament.tournament_stats.push(FactoryGirl.create(:tournament_stat, team:team))
		expect(@tournament).not_to be_valid
	end

end