class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :current_user, only:[:create, :edit]
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
        @user.save
        log_in_user(@user)
      flash[:success] = "New User Created"
      redirect_to @user
    else
      flash[:message] = "Error: empty field or username already taken."
      render :new
    end
  end

  # def authenticate(password)
  #   BCrypt::Password.new(@user.password) == password
  # end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
# :password_confirmation

end
