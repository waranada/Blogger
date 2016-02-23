require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About Us | Twttr"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Twttr"
  end

  test "should get contact" do
  	get :contact
  	assert_response :success
  	assert_select "title", "Contact Us | Twttr"
  end

end
