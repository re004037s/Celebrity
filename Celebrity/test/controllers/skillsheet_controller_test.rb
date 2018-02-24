require 'test_helper'

class SkillsheetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get skillsheet_index_url
    assert_response :success
  end

end
