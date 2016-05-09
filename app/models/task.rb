# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string           not null
#  message      :text             not null
#  time         :string           not null
#  day_of_week  :integer          default(1)
#  day_of_month :integer          default(1)
#  enabled      :boolean          default(TRUE)
#  cron_time    :string
#  team_id      :integer
#

class Task < ActiveRecord::Base
  belongs_to :team
  before_save :get_cron_time
 
  enum day_of_week: {
    :"Monday" => 1,
    :"Tuesday" => 2,
    :"Wednesday" => 3,
    :"Thursday" => 4,
    :"Friday" => 5,
    :"Saturday" => 6,
    :"Sunday" => 7
  }
    
  def get_cron_time
    if self.time == 'Weekly'
      self.cron_time = "* * * * #{Task.day_of_weeks[self.day_of_week]}"
    elsif self.time == 'Monthly'
      if self.day_of_month?
        self.cron_time = "* * #{day_of_month} * *"
      end  
    end  
  end  
end
