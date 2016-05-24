# == Schema Information
#
# Table name: messages
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  message        :string           not null
#  specific_users :text             default("all")
#  team_id        :integer
#

require 'send_message_to_all_users_worker'
require 'text_message_worker'
class Message < ActiveRecord::Base 
  has_and_belongs_to_many :users			
  belongs_to :team
  after_save :send_to_users

  def send_to_users
  	if self.user_ids.any?
      self.user_ids.each do |user_id|
      	user = User.find_by(id: user_id)
      	TextWorker.perform_async(user.number, self.message)
      end	
  	else	
      number_array = team.users.all.map{ |user| user.number }
      SendToAllUsersWorker.perform_async(number_array, self.message)  
  	end
  end  
end
