class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :show, :update, :destroy]
  def new
  end

  def create
    # @user = User.new( first_name: params[:first_name], last_name: params[:last_name], email: params[:Email], location: params[:location], password: params[:Password], password_confirmation: params[:password_confirmation] )
    @user = User.new( user_params )
    if @user.save
      session[:user_id] = @user.id
      redirect_to events_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update( user_params )
      flash[:notice]=["User was successfully updated"]
      redirect_to events_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end  
  end

  def destroy
    reset_session
    User.find(params[:id]).destroy
    redirect_to new_user_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end
end
