require 'spec_helper'
include OwnTestHelper

describe "Player" do
	let!(:team) { FactoryGirl.create(:team, name: "Finland") }
	let!(:GFT) { FactoryGirl.create(:team, name: "Golden Futsal Team") }
	let!(:player) { FactoryGirl.create(:player, name: "Henry", number: 10) }

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

	it "is updated with proper new name" do
		edit_player(player_name:'Henry', new_name:'Henu')
		expect(page).to have_content 'Player was successfully updated'
		expect(page).to have_content 'Henu'
	end

	it "is not updated with improper new name" do
		edit_player(player_name:'Henry', new_name:'a')
		expect(page).to have_content 'Name is too short (minimum is 3 characters)'
	end


end