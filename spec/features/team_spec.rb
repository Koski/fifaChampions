require 'spec_helper'
include OwnTestHelper

describe "Team" do
	
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
end