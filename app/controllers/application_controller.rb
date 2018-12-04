class ApplicationController < ActionController::Base
  helper_method :current_user
  # before_action :authenticate, only: [:index]

 def log_in_user(user)
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
   # !!session[:user_id]
 end
 #on the form, you can compare the user to session[:user_id]
 

 def authorized?(user_id)
   logged_in_user_id == user_id
 end

 def set_up_global_errors
   @errors = flash[:errors]
 end

 private

 def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

 # def authenticate
 #   redirect_to new_session_path unless logged_in?
 # end

end
