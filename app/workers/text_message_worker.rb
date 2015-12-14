require 'twilio-ruby'

class TextWorker
  include Sidekiq::Worker
  def perform(number, msg)
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
end    
