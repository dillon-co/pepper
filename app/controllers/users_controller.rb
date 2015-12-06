class UsersController < ApplicationController
  before_action :authenticate_team!

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
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
    @boys = User.where(girl: false)
    @girls = User.where(girl: true)
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
