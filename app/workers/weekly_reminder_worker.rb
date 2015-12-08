class WeeklyReminderWorker 
  include Sidekiq::Worker
  def perform
    Team.where(weekly_reminder_enabled: true).each do |team| 
      team.users.pair.each do |user|
        user.pair.each do |user|
          msg = user.paired_message(User.pair[User.pair.index(user).to_i-1])
          number = user.number
          TextWorker.perform(number, msg)
        end
        leaders_message = "#{User.pair[0].name} and #{User.pair[1].name} are planning the event next week."
        [number1, number2, number3].each do |num|
          TextWorker.perform(num, leader_message)
        end     
      end
    end    
  end     
end 


### In case the above fails ###
 
 # Team.all.each do |team|
 #      if team.weekly_reminder_enabled
 #        User.pair.each do |user|