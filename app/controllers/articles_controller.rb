class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
    # render plain
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    #redirect after the saving
    redirect_to article_show(@article)
  end
  
  private
    def article_params
      # permit the values of the title and description, hash
      params.require(:article).permit(:title, :description)
    end
  
  
end