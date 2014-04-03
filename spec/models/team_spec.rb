require 'spec_helper'

describe Team do

	let(:team){ FactoryGirl.create(:team) }

	it "should be valid with long enough name" do
		expect(team).to be_valid
	end

	it "should not be valid with too short name" do
		team = FactoryGirl.build(:team, name:"ko")
		expect(team).not_to be_valid
	end
	it "should not be valid with too long name" do
		team = FactoryGirl.build(:team, name:"	asdksjdurkjhiskjhgtjkjthjjjjj
												asdksjdurkjhiskjhgtjkjthjjjjj
												asdksjdurkjhiskjhgtjkjthjjjjj")

		expect(team).not_to be_valid
	end
end