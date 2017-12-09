require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "hello" do
    mail = MessageMailer.hello
    assert_equal "Hello", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
