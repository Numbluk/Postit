class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      flash[:notice] = "Hello #{user.username}! You are now logged in."
      session[:current_user_id] = user.id
      redirect_to posts_path
    else
      flash[:error] = 'Your input did not match what is in storage.'
      redirect_to login_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = 'You are now logged out.'
    redirect_to posts_path
  end
end
