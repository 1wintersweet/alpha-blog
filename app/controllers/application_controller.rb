class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  
  # ||= is a standard Ruby operator: 
  #This is saying, set @_current_user to {SOMETHING} if it is nil, false, or undefined. Otherwise set it to @_current_user, or in other words, do nothing. An expanded form:

#@_current_user || @_current_user = {SOMETHING}

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    #debugger
    !! current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
end
