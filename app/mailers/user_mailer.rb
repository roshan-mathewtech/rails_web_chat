class UserMailer < ApplicationMailer

	def send_weekly_report(user)
    @user = user
    @weekly_messages_count = Message.where('created_at >= ?', 1.week.ago).count
    @user_last_message_datetime = Message.select(:created_at).where('user_id = ?', @user.id).last.created_at
    @last_msg_date = @user_last_message_datetime.strftime("#{@user_last_message_datetime.day.ordinalize} of %B")
    @count_of_messages_since_last_message_of_user = Message.where('created_at > ?', @user_last_message_datetime).count
      
    mail to: @user.email, subject: "Weekly chat report"
  end
end
