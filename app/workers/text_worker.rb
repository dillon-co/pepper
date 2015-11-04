class SmsWorker
  include Sidekiq::Worker
  def perform
    User.pair.each do |user|
      msg = user.message
      number = user.number
      api = Twilio::REST::Client.new(ENV['ACTIVITIES_ACCOUNT_SID'], ENV['ACTIVITIES_AUTH_TOKEN']) 
      messages = msg.scan(/.{1,800}/m)
      response = messages.each do |message|
        api.messages.create(
          body: "#{message} ",
          to: number,
          from: +18018713392
        )
      end
    end  
  end     
end 
  