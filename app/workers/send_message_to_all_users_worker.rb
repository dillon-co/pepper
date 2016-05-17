class SendToAllUsersWorker
  include Sidekiq::Worker
  def perform(team, message)
    team.users.all.each do |user|
      TextWorker.perform_async(user.number, message)
    end 
  end
end  
