module OwnTestHelper

	def sign_in(credentials)
		visit new_user_session_path
		fill_in('user_username', with:credentials[:username])
		fill_in('user_password', with:credentials[:password])
		click_button('Login')
	end

	def add_team(params)
		visit new_team_path
		fill_in('team_name', with:params[:name])
		click_button('Create Team')
	end

	def fill_player_with_name_and_number(params)
		visit new_player_path
		fill_in('player_name', with:params[:name])
		fill_in('player_number', with:params[:number])
	end

	def fill_tournament_with_name(params)
		visit new_tournament_path
		fill_in('tournament_name', with:params[:name])
	end

end