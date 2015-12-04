class Task < ActiveRecord::Base
  belongs_to :team
  before_save :get_cron_time
 
  enum day_of_week: {
    "Monday": 1,
    "Tuesday": 2,
    "Wednesday": 3,
    "Thursday": 4,
    "Friday": 5,
    "Saturday": 6,
    "Sunday": 7
  }

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
    
  def get_cron_time
    if self.time == 'Weekly'
      self.cron_time = "* * * * #{Task.day_of_weeks[self.day_of_week]}"
    elsif self.time == 'Monthly'
      if self.day_of_month?
        self.cron_time = "* * #{day_of_month} * *"
      end  
    end  
  end  
end
