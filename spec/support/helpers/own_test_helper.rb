module OwnTestHelper

	def sign_in(credentials)
		visit new_user_session_path
		fill_in('user_username', with:credentials[:username])
		fill_in('user_password', with:credentials[:password])
		click_button('Login')
	end

end