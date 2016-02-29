class CategoriesController < ApplicationController
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  
  end
  
  def new
    @category = Category.new
  
  end
  
  def show
  
  end
  
  
  def create
    @category = Category.new(category_params)
    if @category.save
      
      flash[:success] = "Category created"
      redirect_to categories_path
    else
      render 'new'
    end
  
  end
  
  
  private
    def set_category
      @category = Category.find(params[:id])
    end
    
    def category_params
      # permit the values of the title and description, hash
      params.require(:category).permit(:name)
    end
    


end
  