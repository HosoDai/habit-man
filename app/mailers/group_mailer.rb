class GroupMailer < ApplicationMailer
  def invite_member(group, user)
    @group = group
    @user = user
    mail(to: @user.email, subject: "Invitation to join the group")
  end
end
