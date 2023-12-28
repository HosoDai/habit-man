class NotificationMailer < ApplicationMailer
  def notification_for_member(notification, group)
    @notification = notification
    @group = group
    mail bcc: @group.users.pluck(:email), subject: "#{@notification.title} from #{@notification.user.name}"
  end

  def comment_notification(notification, comment, group)
    @notification = notification
    @comment = comment
    @group = group
    @notification.memo_comments.each do |memo_comment|
      mail(to: memo_comment.user.email, subject: "#{@comment.comment} from #{@comment.user.name}")
    end
  end
end
