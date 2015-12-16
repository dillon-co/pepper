class MessagesController < ApplicationController

  def new
    @user_names = []
    @users = User.all
    @message = Message.new
  end
  
  def create
    message = Message.new(message_params)
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
