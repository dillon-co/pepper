class SendToAllUsersWorker
  include Sidekiq::Worker
  def perform(team, message)
    team.each do |number|
      # TextWorker.perform_async(number, message)
      puts "sending to #{number}"
    end 
  end
end  
