class SmsWorker
  include Sidekiq::Worker
  def perform
    user = User.find_next_person
    msg = user.message
    number = user.number

    api = Twilio::REST::Client.new(ENV['ACTIVITIES_ACCOUNT_SID'], ENV['ACTIVITIES_AUTH_TOKEN']) 
    messages = msg.scan(/.{1,800}/m)
    messages.each do |message|
      response = api.messages.create(
        body: message,
        to: number,
        from: "+15005550006"
      )
      response
      puts response.status
    end  
  end    
end 
  