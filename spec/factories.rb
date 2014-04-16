FactoryGirl.define do
	factory :user do
		sequence (:username) {|n| "HessuNr#{n}"}
		sequence (:email) {|n| "hessu#{n}@kokkikoo.fi"}
		password "kokkikartano"
	end

	factory :tournament do
		sequence (:name) {|n| "TestTournis#{n}"}
	end

	factory :tournament_stat do
		user
		tournament
		standing 1
		team
		points 0
	end

	factory :team do
		sequence (:name) {|n| "testName#{n}"}
	end

	factory :player do
		sequence (:name) {|n| "playerNr#{n}"}
	end
end