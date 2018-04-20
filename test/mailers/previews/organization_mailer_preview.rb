# Preview all emails at http://localhost:3000/rails/mailers/organization_mailer
class OrganizationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/organization_mailer/timecard_reminder
  def timecard_reminder
    user = User.third
    organization = Organization.first
    OrganizationMailer.timecard_reminder(user, organization)
  end

end
