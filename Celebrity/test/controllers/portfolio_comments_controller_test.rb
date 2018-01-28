require 'test_helper'

class PortfolioCommentsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @comment = comments(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete comment_path(@comment)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong comment" do
    log_in_as(users(:michael))
    comment = comments(:ants)
    assert_no_difference 'Comment.count' do
      delete comment_path(comment)
    end
    assert_redirected_to root_url
  end
end
