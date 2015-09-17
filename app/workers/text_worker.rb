class SmsWorker
  include Sidekiq::Worker
  def perform
    user = User.find_next_person
    msg = user.message
    number = user.number

    api = Twilio::REST::Client.new(ENV['activities_account_sid']), ENV['activities_auth_token'] 
    messages = msg.scan(/.{1,800}/m)
    messages.each do |message|
      api.messages.create(
        body: message
        to: number
        from: "+18018713392"
      )
    end  
  end  

  
end  