module SessionsHelper

  # Create a new session with user
  def login(user)
    session[:user_id] = user.id
  end

  # Clear session
  def logout
    session.clear
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
