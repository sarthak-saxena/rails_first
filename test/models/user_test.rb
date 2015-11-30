require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "sarthak" , email: "sarthakvit@gmail.com", password: "foobar" , password_confirmation: "foobar")
  end

  test "user is valid" do
  	assert @user.valid?
  end

  test "user name should be present" do
  	@user.name = "      "
  	assert_not @user.valid?
  end

 

end
