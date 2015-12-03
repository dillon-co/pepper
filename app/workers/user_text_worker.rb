class CustomTask
  include Sidekiq::Worker
  def perform
    User.all.each do |user|
      Task.all.each do |task|
        t = Time.now
        minute, hour, month_day, month, week_day = task.cron_time.split(' ')
        message, number = task.message, user.number
        if task.time == "Monthly"
          if t.day == month_day.to_i
            send_message(message, number)
          end  
        elsif task.time == "Weekly" 
          if t.wday == week_day.to_i
            send_message(message, number)
          end  
        else
          render :error  
        end  
      end    
    end  
  end

  def send_message(msg, number)
    api = Twilio::Rest::Client.new(ENV['ACTIVITIES_ACCOUNT_SID'], ENV['ACTIVITIES_AUTH_TOKEN'])
    messages = msg.scan(/.{1,800}/m)
    messages.each do |message|
      api.messages.create {
        body: message,
        to: number,
        from: +18018713392
      }
    end
  end  
end  
        









