class SmsWorker
  include Sidekiq::Worker
  def perform
    User.pair.each do |user|
      msg = user.paired_message(User.pair[User.pair.index(user).to_i-1])
      number = user.number
      api = Twilio::REST::Client.new('AC878088af0693b184b942532a7566bd74', '5953cb241200d6f56a7505c71d0e79c6')
      messages = msg.scan(/.{1,800}/m)
      response = messages.each do |message|
        api.messages.create(
          body: message,
          to: number,
          from: +18018713392
        )
      end
    end  
  end     
end 
