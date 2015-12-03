Task.all.each do |task|
  class CustomTask
    include Sidekiq::Worker
    def perform
      User.all.each do |user|
        msg = task.message
        number = User.number
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
  end  
end  