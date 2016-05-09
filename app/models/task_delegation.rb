# == Schema Information
#
# Table name: task_delegations
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  event      :string
#  tasks      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskDelegation < ActiveRecord::Base
  belongs_to :team
  after_save :delegate_tasks_from_hash

  def delegate_tasks_from_hash
    user_task_hash.keys.each do |user|
      users_tasks = user_task_hash[user].to_sentence
      user.message.new(message: "Hey #{user.name}, we're planning the event \"#{event}\" on #{event_date}, and you've been assigned to help with #{users_tasks}. #{call_to_action} :)")  
    end
  end  

  def call_to_action
    ["Can you do it?", "Are you up for the challenge?", "Does that work?", "Sound good?"].sample
  end  

  def user_task_hash
    delegation_hash = Hash.new
    while tasks_array.length >= team.users.count
      team.users.each do |user|
        delegation_hash[user.name] = [] << task.last 
        task.pop
      end  
    end
    delegation_hash
  end

  def tasks_array
    tasks.split(', ').dup
  end   

end
