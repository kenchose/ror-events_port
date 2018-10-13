class EventsController < ApplicationController
  def index
    @events = Event.all
    @users = User.all
    @joins = Join.all
  end

  def create
    @user = User.find(session[:user_id])
    @event = Event.new( event_params )
    if @event.save
      flash[:notice] = ["You have successfully created a new event."]
      redirect_to events_path
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to events_path
    end
  end

  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to events_path
  end

  private 
    def event_params
      params.require(:event).permit(:name, :date, :detail, :city, :state, :user_id)
    end
end
