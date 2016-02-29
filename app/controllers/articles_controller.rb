class ArticlesController < ApplicationController
  
  # only 4 actions not all
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    # get all articles
    #@articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #debugger
    # render plain
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = current_user
   # @article.save
    #redirect after the saving
  #  redirect_to article_path(@article)
    
    # usual create operation
    if @article.save
      # do something
      # where to display - views are wrapped by application.html.erb -> all message will be there. 
      flash[:success] = "Article is saved successfully"
      redirect_to article_path(@article)
    else
      # if validation has not passed, re-render the new form
      render 'new' # reload the same new template
    end 
  end
  
  def show # need to know the id so the object is the article created
  end 
  
  def edit # bring up the form to display an existing article    @article = Article.find(params[:id])
  end 
  
  def update #similar to save operation above    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article is updated successfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
  
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      # permit the values of the title and description, hash
      params.require(:article).permit(:title, :description)
    end
    
    def require_same_user
      # 
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only delete or edit your own articles"
        redirect_to root_path
      end
    end
  
end 