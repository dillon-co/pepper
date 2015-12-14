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

  def edit
    @task = Task.find(params[:id]) 
  end 

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      redirect_to task_path(task)
    else
      render :show
    end    
  end 
    
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :message, :time, :day_of_month, :enabled)
  end  
end
