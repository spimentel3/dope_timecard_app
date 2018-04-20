require 'test_helper'

class OrganizationMailerTest < ActionMailer::TestCase
  test "timecard_reminder" do
    mail = OrganizationMailer.timecard_reminder
    assert_equal "Timecard reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
