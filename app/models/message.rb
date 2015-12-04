class Message < ActiveRecord::Base
  belongs_to :team
  after_save :send_to_all

  def send_message(msg, number)
    api = Twilio::Rest::Client.new(ENV['ACTIVITIES_ACCOUNT_SID'], ENV['ACTIVITIES_AUTH_TOKEN'])
    messages = msg.scan(/.{1,800}/m)
    messages.each do |message|
      api.messages.create(
        body: message,
        to: number,
        from: +18018713392
      )
    end
  end

  def send_to_all
    User.all.each do |user|
      send_message(self.message, user.number)
    end  
  end  
end
