class SearchController < ApplicationController
  def index
    @items = Item.search(params[:term])
  end
end
