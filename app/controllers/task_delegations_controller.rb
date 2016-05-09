class TaskDelegationsController < ApplicationController

  def new
    @task_delegation = current_team.task_delegation.new
  end  

  def create
    task_delegation = current_team.task _delegation.new(task_params)
    if task.save
      redirect_to root_url
    else
      render :new 
    end   
  end
  
  private

  def task_params
    params.require(:task_delegation).permit(:event, :tasks, :event_date)
  end  
end
