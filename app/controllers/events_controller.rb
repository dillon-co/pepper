class EventsController < ApplicationController
  before_action :validate_user
  
  def validate_user
    redirect_to root_path unless team_signed_in? 
  end
    
  def new
    @event = Event.new
  end

  def create
    @event = current_team.events.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end    
  end
    
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.order('date')
  end  

  def edit
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :tasks, :description)
  end
end
