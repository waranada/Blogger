require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "invalid signup information" do
		get signup_path
		assert_no_difference 'User.count' do
			post users_path, user: { full_name: "",
									username: "testuser",
									email: "testuser@example",
									password: ",.//.,",
									password_confirmation: ",.//.,,./" }
		end
		assert_template 'users/new'
		assert_select 'div#<CSS id for error explanation>'
        assert_select 'div.<CSS class for field with error>'
	end

	test "valid signup information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: { full_name: "Test User",
												 username: "testuser",
												 email: "testuser@example.com",
												 password: ",.//.,,./",
												 password_confirmation: ",.//.,,./" }
		end
		assert_template 'users/show'
		assert is_logged_in?
	end

end
