require 'spec_helper'
include OwnTestHelper

describe "user" do

	let!(:user) { FactoryGirl.create(:user) }

	describe "who has signed up" do

		it "can sign in with right credentials" do
			sign_in(username:"Hessu", password:"kokkikartano")
			expect(page).to have_content 'Hessu'
			expect(page).to have_content 'Signed in successfully'
		end

	end

end