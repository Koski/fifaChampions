FactoryGirl.define do
	factory :user do
		id 1
		username "Hessu"
		password "kokkikartano"
		email "hessu@kokkikoo.fi"
	end
	

	factory :tournament do
		name "kartano open"
	end

	factory :tournament_stat do
		user_id 1
		tournament_id 1
		standing 1
		team_id 1
	end

	factory :team do
		name "Finland"
	end
end