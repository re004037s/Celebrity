require 'test_helper'

class CommentsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "comment interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # 無効な送信
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # 有効な送信
    content = "This comment really ties the room together"
    assert_difference 'Comment.count', 1 do
      post comments_path, params: { comment: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # 投稿を削除する
    assert_select 'a', text: 'delete'
    first_comment = @user.comments.paginate(page: 1).first
    assert_difference 'Comment.count', -1 do
      delete comment_path(first_comment)
    end
    # 違うユーザーのプロフィールにアクセス (削除リンクがないことを確認)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
