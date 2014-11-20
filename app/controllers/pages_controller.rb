class PagesController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @page = @wiki.pages.create(page_params)
    redirect_to wiki_path(@wiki)
  end

  private
  def page_params
    params.require(:page).permit(:name, :body)
  end
end
