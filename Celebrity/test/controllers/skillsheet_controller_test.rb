require 'test_helper'

class SkillsheetControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get skillsheet_upload_url
    assert_response :success
  end

end
