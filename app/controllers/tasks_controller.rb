class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to root_path :flash => { :success => "Task Added!"}
    else
      render :new
    end  
  end  
  
  def index
    @tasks = Task.all
  end

  def show
  end

  private

  def task_params
    params.require(:task).permit(:name, :message, :time, :day_of_month)
  end  
end
