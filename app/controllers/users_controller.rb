class UsersController < ApplicationController
  
  def new
    @user = User.new
  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog"
      redirect_to articles_path
    else
      render 'new'
    end
    
  end
  
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
    def user_params
      # permit the values of the title and description, hash
      params.require(:user).permit(:username, :email, :password)
    end
  
  

  
end
