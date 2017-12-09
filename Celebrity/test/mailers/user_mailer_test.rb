require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "alert_completion_date" do
    mail = UserMailer.alert_completion_date
    assert_equal "Alert completion date", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
