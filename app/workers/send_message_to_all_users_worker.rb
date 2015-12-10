class SendToAllUsersWorker
  include Sidekiq::Worker
  def perform(message)
    User.all.each do |user|
      TextWorker.perform_async(user.number, message)
    end 
  end
end  
