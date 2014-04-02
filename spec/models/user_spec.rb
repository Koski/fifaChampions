require 'spec_helper'

describe User do

	let(:user){ FactoryGirl.create(:user) }

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
end
