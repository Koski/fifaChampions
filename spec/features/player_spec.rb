require 'spec_helper'
include OwnTestHelper

describe "Player" do
	let!(:team) { FactoryGirl.create(:team) }
	let!(:GFT) { FactoryGirl.create(:GFT) }

	it "is saved with valid parameters" do
		fill_player_with_name_and_number(name:'Teemu Pukki', number: 10)
		click_button('Create Player')
		expect(page).to have_content('Player was successfully created.')
	end

	it "is saved with a team selected " do
		fill_player_with_name_and_number(name:'Teemu Pukki', number: 10)
		find('#player_team_ids').find(:xpath, 'option[1]').select_option
		click_button('Create Player')
		
		expect(page).to have_content 'Plays for'
		expect(page).to have_content 'Finland'
	end

	it "is saved with two teams selected" do
		fill_player_with_name_and_number(name:'Simo Linkola', number: 9)
		find('#player_team_ids').find(:xpath, 'option[1]').select_option
		find('#player_team_ids').find(:xpath, 'option[2]').select_option
		click_button('Create Player')
		
		expect(page).to have_content 'Plays for'
		expect(page).to have_content 'Finland'
		expect(page).to have_content 'Golden Futsal Team'
	end
end