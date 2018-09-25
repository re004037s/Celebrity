require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "associated comments should be destroyed" do
    @user.save
    @user.comments.create!(content: "Lorem ipsum")
    assert_difference 'Comment.count', -1 do
      @user.destroy
    end
  end
end
