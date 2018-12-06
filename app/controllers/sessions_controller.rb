class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password_digest])
    # unauthenticated_user = User.find_by(username: params[:username])
    # @user = unauthenticated_user.authenticate(params[:password])
    # if @user && unauthenticated_user
      log_in_user(@user)
      redirect_to listings_path
    else
      flash[:error] = [ "Username or password didn't match" ]
      redirect_to new_session_path
    end
  end
  

  def destroy
    log_out
    redirect_to listings_path
  end
end
