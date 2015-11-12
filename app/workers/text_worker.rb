class SmsWorker
  include Sidekiq::Worker
  def perform
    User.pair.each do |user|
      msg = user.paired_message(User.pair[User.pair.index(user).to_i-1])
      number = user.number
      api = Twilio::REST::Client.new('AC878088af0693b184b942532a7566bd74', '5953cb241200d6f56a7505c71d0e79c6')
      api = Twilio::REST::Client.new(ENV['ACTIVITIES_ACCOUNT_SID'], ENV['ACTIVITIES_AUTH_TOKEN'])
      messages = msg.scan(/.{1,800}/m)
      messages.each do |message|
        api.messages.create(
          body: message,
          to: number,
          from: +18018713392
        )  
      end
      [number1, number2, number3].each do |num|
        api.messages.create(
          body: "#{User.pair[0].name} and #{User.pair[1].name} are planning the event next week.",
          to: num,
          from: +18018713392
        )
    end  
  end     
end 
