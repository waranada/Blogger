require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
  	@user = User.new(full_name: "Example User", username: "exampleuser", email: "user@example.com",
                      password: "sample_app", password_confirmation: "sample_app")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "fullname should be present" do
  	@user.full_name = "   "
  	assert_not @user.valid?
  end

  test "username should be present" do
    @user.username = "  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "fullname should not be too long" do
    @user.full_name = "a" * 26
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 13
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 245
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "TesT@ExAmple.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "username should be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username.upcase
    @user.save
    assert_not duplicate_user.valid?
  end


  test "user should be saved as lower-case" do 
    mixed_case_username = "TeStUser"
    @user.username = mixed_case_username
    @user.save
    assert_equal mixed_case_username.downcase, @user.reload.username
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 7
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = " " * 7
    assert_not @user.valid?
  end
end
