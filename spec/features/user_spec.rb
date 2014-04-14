require 'spec_helper'
include OwnTestHelper

describe "user" do

	let!(:user) { FactoryGirl.create(:user, username: "Hessu") }

	describe "who has signed up" do

		it "can sign in with right credentials" do
			sign_in(username:"Hessu", password:"kokkikartano")
			expect(page).to have_content 'Hessu'
			expect(page).to have_content 'Signed in successfully'
		end

		it "can't sign in with wrong credentials" do
			sign_in(username:"Hessu", password:"wrong")
			expect(page).to have_content 'Invalid username or password.'
		end

		it "will be have previous form rendered upon unsuccesful login" do
			sign_in(username:"Hessu", password:"wrong")
			expect(page).to have_content 'Login'
			find_field('user_username').value.should eq 'Hessu'
		end
	end

end