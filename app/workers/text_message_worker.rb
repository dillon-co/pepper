require 'twilio-ruby'

class TextWorker
  include Sidekiq::Worker
  def perform(number, msg)
    # This breaks when the ENV variables aren't manually type in.
    api = Twilio::REST::Client.new(ENV['PEPPR_ACCOUNT_SID'], ENV['PEPPR_AUTH_TOKEN'])
      messages = msg.scan(/.{1,800}/m)
      messages.each do |message|
        api.messages.create(
          body: message,
          to: number,
          from: '+18018713392'
        ) 
      end
  end
end    
