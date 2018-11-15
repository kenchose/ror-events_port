class MessagesController < ApplicationController
  before_action :require_login, only: [:create]
  
  def create
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
    @message = Message.new (message_params)
    if @message.save
      redirect_to event_path(@event.id)
    else
      flash[:errors] = ["Textarea was empty"]
      redirect_to event_path(@event.id)
    end
  end

  def terms
  end

  def destroy
  end

  private 

  def message_params
    params.require(:message).permit(:content, :user_id, :event_id)
  end
end
