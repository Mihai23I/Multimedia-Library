require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'password', password_confirmation: "password")
  end


  test "default user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.client.name = "          "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.client.name = "a" * 51
    assert_not @user.valid?
  end
end
