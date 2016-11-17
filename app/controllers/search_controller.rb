class SearchController < ApplicationController

  def index
    @items = Item.for_user(current_user).tagged_with(params[:search][:labels], any: true)
  end

end
