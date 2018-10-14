class MessagesController < ApplicationController
  before_action :require_login, only: [:create]
  
  def create
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
    @message = Message.new (message_params)
    if @message.save
      redirect_to event_path(@event.id)
    else
      flash[:errors] = @message.errors.full_messages
      redirect_to event_path(@event.id)
    end
  end

  def destroy
  end

  private 

  def message_params
    params.require(:message).permit(:content, :user_id, :event_id)
  end
end
