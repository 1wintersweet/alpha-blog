class ArticlesController < ApplicationController
  
  def index
    # get all articles
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    # render plain
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
   # @article.save
    #redirect after the saving
  #  redirect_to article_path(@article)
    
    # usual create operation
    if @article.save
      # do something
      # where to display - views are wrapped by application.html.erb -> all message will be there. 
      flash[:notice] = "article is saved successfully"
      redirect_to article_path(@article)
    else
      # if validation has not passed, re-render the new form
      render 'new' # reload the same new template
    end 
  end
  
  def show # need to know the id so the object is the article created
    @article = Article.find(params[:id])
  end 
  
  def edit # bring up the form to display an existing article
    @article = Article.find(params[:id])
  end 
  
  def update #similar to save operation above
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "article is saved successfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    
    redirect_to articles_path
  end
  
  private
    def article_params
      # permit the values of the title and description, hash
      params.require(:article).permit(:title, :description)
    end
  
end 