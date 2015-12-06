class TeamsController < ApplicationController

  def update
    team = Team.find(params[:id])
    if team.update(team_params)
      redirect_to root_path, :flash => { :success => "Success"}
    else
      redirect_to root_path, :flash => { :danger => "Something went wrong, try again or refresh the page."}
    end    
  end  


  private

  def team_params
    params.require(:team).permit(:id, :weekly_reminder_enabled)
  end  
end
