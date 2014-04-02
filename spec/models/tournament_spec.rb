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


end