require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "supertestuser", email: "tester@tests.com", password_digest: "foobar", password_confirmation: "foobar", city: "Miami", state: "FL")
  end

  test "should be valid" do
    assert @user.valid?
  end

end
