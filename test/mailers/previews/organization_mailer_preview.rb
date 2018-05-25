# Preview all emails at http://localhost:3000/rails/mailers/organization_mailer
class OrganizationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/organization_mailer/timecard_reminder
  def timecard_reminder
    user = User.new name: "Sean Pimentel", email: "sean_pimentel@hotmail.com"
    organization = Organization.new name: "Theia Interactive"
    OrganizationMailer.timecard_reminder(user, organization)
  end

  def timecard_invitation
    user = User.new name: "Stephen Phillips", email: "stephen@theia.io"
    user.activation_token = User.new_token
    organization = Organization.new name: "Theia Interactive"
    OrganizationMailer.timecard_invitation(user, organization)
  end

  def invite_comanager
    user = User.new name: "Stephen Phillips", email: "stephen@theia.io"
    user.activation_token = User.new_token
    organization = Organization.new name: "Theia Interactive"
    OrganizationMailer.invite_comanager(user, organization)
  end

end
