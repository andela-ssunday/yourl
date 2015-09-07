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
      redirect_to welcome_index_path
    end
  end

  def destroy
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
