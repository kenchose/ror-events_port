class JoinsController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @join = Join.new(user: current_user, event: @event)
    if @join.save
      flash[:notice] = ["You have joined to attend to this event!"]
      redirect_to events_path
    else
      flash[:errors] = @join.errors.full_messages
      redirect_to events_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    Join.find_by(user: current_user, event: @event).destroy
    redirect_to events_path
  end
end
