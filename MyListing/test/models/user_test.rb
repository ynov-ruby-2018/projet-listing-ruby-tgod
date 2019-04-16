require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe User do
    it "display full name" do
      user = User.find(users(:admin).id)
      #puts user.inspect
      assert_equal "#{user.email}", user.fullname
    end
  end
end
