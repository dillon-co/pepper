class MessagesController < ApplicationController

  def new
    @user_names = []
    @users = current_team.users.all
    @message = current_team.messages.new
  end
  
  def create
    message = current_team.messages.new(message_params)
    if message.save
      redirect_to root_path, :flash => { :success => "Message Sent!"}
    else
      render :new
    end  
  end

  def index
    @messages = Message.all
  end  

  private

  def message_params
    params.require(:message).permit(:message, user_ids: [])
  end  
end
