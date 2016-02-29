

class PagesController < ApplicationController
  
  def home
    # if users logged in, redirect to home page
    redirect_to articles_path if logged_in?
  end
  
  
  def about
  end
  
end
