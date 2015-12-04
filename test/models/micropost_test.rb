require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
      @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)

end
