class WeeklyReminderWorker 
  include Sidekiq::Worker
  def perform
    paired_users = []
    Team.where(weekly_reminder_enabled: true).each do |team| 
      team.users.pair.each { |user| paired_users << user }
      msg = user.paired_message(User.pair[User.pair.index(user).to_i-1])
      number = user.number
      TextWorker.perform_async(number, msg)
      leaders_message = "#{paired_users[0].name} and #{paired_users[1].name} are planning the event next week."
      [number1, number2, number3].each do |num|
        TextWorker.perform_async(num, leader_message)
      end     
    end    
  end     
end 


### In case the above fails ###
 
 # Team.all.each do |team|
 #      if team.weekly_reminder_enabled
 #        User.pair.each do |user|
