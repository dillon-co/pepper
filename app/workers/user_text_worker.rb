class CustomTask
  include Sidekiq::Worker
  def perform
    User.all.each do |user|
      user.tasks.all.each do |task|
        t = Time.now # t = time. I had to use t becuase time is an attribute on the Task Table
        minute, hour, month_day, month, week_day = task.cron_time.split(' ')
        message, number = task.message, user.number
        if (task.time == "Monthly" && t.day == month_day.to_i) || (task.time == "Weekly" && t.wday == week_day.to_i)
          TextWorker.perform_async(number, message)  
        end  
      end    
    end  
  end
end  
