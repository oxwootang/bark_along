class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      login(@user)
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private
    # Create a new session with user
    def login(user)
      session[:user_id] = user.id
    end

    # Clear session
    def logout
      session.clear
    end

end