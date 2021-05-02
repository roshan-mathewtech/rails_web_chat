namespace :data do  
  desc "Send weekly chat report"  
  task send_weekly_chat_report: :environment do    
    puts 'Sending weekly chat report...'
    users = User.all
    users.each do |user|
    	UserMailer.send_weekly_report(user).deliver_now
    end
  end
end