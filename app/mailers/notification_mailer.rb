class NotificationMailer < ApplicationMailer
  def notification_for_member(notification, group)
    @notification = notification
    @group = group
    mail bcc: @group.users.pluck(:email), subject: "#{@notification.title} from #{@notification.user.name}"
  end

  def comment_notification(memo, comment, group)
    @memo = memo
    @comment = comment
    @group = group
    array_email = []
    @memo.memo_comments.each do |memo_comment|
      unless
        array_email.append(memo_comment.user.email)
      end
    end
    mail bcc: array_email, subject: "#{@comment.comment} from #{@comment.user.name}"
  end
end
