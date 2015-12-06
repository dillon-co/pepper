class SmsWorker
  include Sidekiq::Worker
  def perform
    if Team.find_by(params[:id]).weekly_reminder_enabled
      User.pair.each do |user|
        msg = user.paired_message(User.pair[User.pair.index(user).to_i-1])
        number = user.number
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
end 
