class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password_hash]
    if @user.save
      login(@user)
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def edit
    find_user
  end

  def show
    find_user
  end

  def update
    find_user
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    find_user
    @user.destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email)
    end

    def find_user
      @user = User.find(params[:id])
    end

    # Create a new session with user
    def login(user)
      session[:user_id] = user.id
    end

    # Return current user logged into session
    def current_user
      if session[:user_id]
        User.find(session[:user_id])
      else
        nil
      end
    end
end
