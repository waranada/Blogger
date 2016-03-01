require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
  	@user = User.new(full_name: "Example User", username: "exampleuser", email: "user@example.com")
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

end
