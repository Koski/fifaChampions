require 'spec_helper'
include OwnTestHelper

describe "Team" do

	let!(:GFT) { FactoryGirl.create(:team, name: "Riipilän Raketti") }

	it "is created with valid parameters" do
		add_team(name:"Golden Futsal Team")
		expect(page).to have_content 'Team was successfully created.'
	end

	it "is shown in teams page when created" do
		add_team(name:"Golden Futsal Team")
		visit teams_path
		expect(page).to have_content 'Golden Futsal Team'
	end

	it "is not created with too short name" do
		add_team(name:"ok")
		expect(page).to have_content 'Name is too short (minimum is 3 characters)'	
	end

	it "is not created with too long name " do
		add_team(name:"	qwertyuioqwertyuioqwertyu
						qwertyuioqwertyuioqwertyu
						qwertyuioqwertyuioqwertyu")
		expect(page).to have_content 'Name is too long (maximum is 50 characters)'
	end

	it "has previous form rendered upon unsuccesful creation" do
		add_team(name:"kk")
		find_field('team_name').value.should eq 'kk'
	end

	it "is updated with proper new name" do
		edit_team(team_name:"Riipilän Raketti", new_name:"Pallo-Pojat")
		expect(page).to have_content("Team was successfully updated")
		expect(page).to have_content("Pallo-Pojat")
	end

	it "is not updated with improper name" do
		edit_team(team_name:"Riipilän Raketti", new_name:"Pp")
		expect(page).to have_content("Name is too short (minimum is 3 characters)")
	end

	
end