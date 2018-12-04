class ApplicationController < ActionController::Base
  before_action :current_user


private
  def log_in!(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def logged_in_user_id
    session[:user_id]
  end

  def logged_in?
    !!logged_in_user_id
  end
  #
  # def authorized?(user_id)
  #   logged_in_user_id == user_id
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
