require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  def setup
  	@page_title = "Twttr"
  end

  test "should get home" do
  	get :home
  	assert_response :success
  	assert_select "title", "Your window to the world | #{@page_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About Us | #{@page_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@page_title}"
  end

  test "should get contact" do
  	get :contact
  	assert_response :success
  	assert_select "title", "Contact Us | #{@page_title}"
  end

end
