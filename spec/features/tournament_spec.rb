require 'spec_helper'
include OwnTestHelper

describe "Tournament" do

	before :all do
    	self.use_transactional_fixtures = false
	end

	before :each do
	    DatabaseCleaner.strategy = :truncation
	    DatabaseCleaner.start

	    @user1 = FactoryGirl.create(:user)
	    @user2 = FactoryGirl.create(:user, username:'Pauli', email:"pauli@paula.fi")
	    @team1 = FactoryGirl.create(:team)
	    @team2 = FactoryGirl.create(:team, name:"Golden Futsal Team")
  	end

	after :each do
    	DatabaseCleaner.clean
  	end

  	after :all do
    	self.use_transactional_fixtures = true
  	end


	it "should be saved with valid parameters", js:true do
		fill_tournament_with_name(name:'Mega cup')
		click_button('Create Tournament')
		expect(page).to have_content('Tournament was successfully created')
	end

	it "should show selected participants, team and points when created",js:true do
		fill_tournament_with_name(name:'Mega cup')

		find('#participantAmount').find(:xpath, 'option[2]').select_option
		input = find('div.tournament_input:nth-of-type(1)')
		input.find('#tournament_tournament_stats_attributes__user_id').find(:xpath, 'option[2]').select_option
		input.find('#tournament_tournament_stats_attributes__team_id').find(:xpath, 'option[2]').select_option
		click_button('Create Tournament')
		expect(page).to have_content 'Pauli Golden Futsal Team'
		expect(page).to have_content 'Hessu Finland'
	end

	it "should not save with two identical stats", js:true do
		fill_tournament_with_name(name:'Mega cup')
		find('#participantAmount').find(:xpath, 'option[2]').select_option
		click_button('Create Tournament')
		expect(page).to have_content 'Team has to be unique'
		expect(page).to have_content 'User has to be unique'
	end

end