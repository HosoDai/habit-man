# Preview all emails at http://localhost:3000/rails/mailers/group_mailer
class GroupMailerPreview < ActionMailer::Preview
  def invite_member
    group = Group.first
    user = User.first
    GroupMailer.invite_member(group, user)
  end
end
