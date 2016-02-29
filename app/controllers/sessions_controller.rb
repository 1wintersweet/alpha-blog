class SessionsController < ApplicationController
  
  
  def new
   # @session = Session.new
  end
  
  def create
  #  @session = Session.find()
  #render 'new'
  # debugger
  user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy
   session[:user_id] = nil
   flash[:success] = "You have logged out successfully"
   redirect_to root_path
  end
end

