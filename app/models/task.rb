class Task < ActiveRecord::Base
  belongs_to :team
  before_save :get_cron_time

  def get_cron_time
    if self.time == 'Weekly'
      day = rand(7)
      self.cron_time = "* * * * #{day}"
    elsif self.time == 'Monthly'
      day = rand(28)
      self.cron_time = "* * #{day} * *"
    end  
  end  
end
