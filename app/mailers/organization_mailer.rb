class OrganizationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organization_mailer.timecard_reminder.subject
  #
  def timecard_reminder(user, organization)
    @user = user
    @organization = organization
    mail to: user.email, subject: "Timecards are due!"
  end
end
