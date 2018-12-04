class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password_digest])
     log_in!(@user)
     redirect_to listings_path
    else
      redirect_to new_session_path

  end
end

  def destroy
    log_out
    redirect_to new_session_path
  end
end
