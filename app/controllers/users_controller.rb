class UsersController < ApplicationController
  before_filter :set_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to welcome_index_path
    else
      flash[:notice] = "Error occured"
      redirect_to sign_up_path
    end
  end

  def destroy
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :username)
    end

    def set_user
      @user = User.find(params[:id])
      redirect_to root_path if params[:id].to_i!=session[:user_id]
    end
end
