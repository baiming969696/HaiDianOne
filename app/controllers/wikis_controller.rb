class WikisController < ApplicationController
  def new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.save
    redirect_to @wiki
  end
  
  def show
    @wiki = Wiki.find(params[:id])
  end

  def index
    @wikis = Wiki.all
  end
 
  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
 
    if @wiki.update(wiki_params)
      redirect_to @wiki
    else
      render 'edit'
    end
end
 
private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  private
  def wiki_params
    params.require(:wiki).permit(:name, :description)
  end
end
