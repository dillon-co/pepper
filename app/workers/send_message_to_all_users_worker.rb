class SendToAllUsersWorker
  include Sidekiq::Worker
  def perform(message)
    User.all.each do |user|
      TextWorker.perform(user.number, message)
    end 
  end
end  