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

	factory :tour_stat, class: TournamentStat do
		user_id 2
		tournament_id 1
		standing 2
		team_id 2
	end

	factory :team do
		name "Finland"
	end

	factory :tournament_ramrod, class: Tournament do
		name "Ramrod"
	end
end