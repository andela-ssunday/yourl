class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      user.last_sign_in_at = Time.now
      user.save!
      User.increment_counter :sign_in_count, user.id
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to user, notice: "Welcome"
    else
      flash.now.alert = "Wrong cridentials"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    flash = nil
    redirect_to root_path
  end

end
