class UsersController < ApplicationController
  before_action :authenticate_team!

  def new
    @user = User.new
  end

  def create
    user = current_team.user.new(user_params)
    if user.save
      redirect_to new_user_path, :flash => { :success => "Member Added!"}
    else
      render :new  
    end  
  end   

  def index
    @boy_counter = 1
    @girl_counter = 1
    @team = Team.find_by(params[:id])
    @boys = current_team.user.where(girl: false)
    @girls = current_team.user.where(girl: true)
    @tasks = Task.where(enabled: true)
  end

  def edit
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :number, :girl)
  end  
end
