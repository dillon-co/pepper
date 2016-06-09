# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date        :datetime         not null
#  title       :string           not null
#  description :text             not null
#  tasks       :text             not null
#  team_id     :integer
#

class Event < ActiveRecord::Base
  belongs_to :team
  # after_save :task_array, :user_task_hash  
  after_save :task_array, :delegate_tasks_from_hash

  def delegate_tasks_from_hash
    user_task_hash.keys.each do |user|
      puts user
      if user_task_hash[user]
        users_tasks = user_task_hash[user].to_sentence
        puts "\n\n\n\n\n\n\n\n#{User.find(name: user).message.count}\n\n\n\n\n\n\n\n"
        User.find_by(name: user).messages.create(message: "Hey #{user}, we're planning \"#{title}\" on #{date}, #{description}. 
                                You've been assigned to help with #{users_tasks}. #{call_to_action} :)")  
      end
    end
  end  

# Combine these 2 methods^v^
  def user_task_hash
    # puts tasks_array
    counter = 0
    delegation_hash = Hash.new{|hash, key| hash[key] = []}
    until counter >= task_array.length
      team.users.each do |user|
        break if counter >= task_array.length
        delegation_hash[user.name] << task_array[counter] 
        puts "#{user.name} <==is getting==> #{task_array[counter]}" 
        counter += 1  
      end  
    end
  end

  def call_to_action
    ["Can you do it?", "Are you up for the challenge?", "Does that work?", "Sound good?"].sample
  end  

  # def delegation_hash
  #   h = Hash.new{|hash, key| hash[key] = []}
  # end  


  def task_array
    tasks.split(', ')
  end   

end

