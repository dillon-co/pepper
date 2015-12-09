class Message < ActiveRecord::Base
  belongs_to :team
  after_save :send_to_all_users

  def send_to_all_users
    SendToAllUsersWorker.perform_async(self.message)  
  end  
end
