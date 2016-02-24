class ArticlesController < ApplicationController
  
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
  
  private
    def article_params
      # permit the values of the title and description, hash
      params.require(:article).permit(:title, :description)
    end
  
end 