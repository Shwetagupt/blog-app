class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :profile]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def profile
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def friend_request
    user = User.find(params[:id])
    current_user.friend_request(user)
    flash[:notice] = "request send"
    redirect_to '/users'
  end

  def accept_request
    user = User.find(params[:id])
    current_user.accept_request(user)
    flash[:notice] = "Added as friend"
    redirect_to '/users'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
