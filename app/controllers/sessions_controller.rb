class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to events_path
    else
      flash[:errors] = ['Invalid Combination']
      redirect_to new_user_path
    end
  end

  def destroy
    if current_user == User.find(params[:id])
      reset_session
      redirect_to new_user_path
    end
  end
end
