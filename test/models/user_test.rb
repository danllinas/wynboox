require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    @user = User.new(username: "supertestuser", email: "tester@tests.com", password: "foobar", password_confirmation: "foobar", city: "Miami", state: "FL")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "email should be present and not blank" do
    @user.email = "        "
    assert_not @user.valid?
  end

  test "email should adhere to regex" do
    valid_email = %w(user@example.com USER@foo.COM A_us-er@foo.bar.org alice+bob@baz.cn)
    valid_email.each do |email|
      @user.email = email
      assert @user.valid?
      puts "#{email.inspect} should be valid"
    end
  end

  test "should reject invalid emails" do
    invalid_email = %w(user@example,com user_at_foo.com user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com)
    invalid_email.each do |email|
      @user.email = email
      assert_not @user.valid?
      puts "#{email.inspect} should be invalid."
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "username should be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username.upcase
    @user.email = "some@thingnew.com"
    @user.save
    assert duplicate_user.valid?
  end

end
