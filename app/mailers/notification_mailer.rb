class NotificationMailer < ApplicationMailer
  def notification_for_member(notification, group)
    @notification = notification
    @group = group
    mail bcc: @group.users.pluck(:email), subject: "#{@notification.title} from #{@notification.user.name}"
  end
end
