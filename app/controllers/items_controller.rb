class ItemsController < ApplicationController
  before_filter :find_directory
  before_filter :find_item

  def new
    @item = Item.new
  end

  def create
    @item = @directory.items.create(item_params)
    render @item
  end

  def update
    @item.update(item_params)
    redirect_to directory_path(@directory)
  end

  def destroy
    @item.destroy
    redirect_to directory_path(@directory)
  end

  private

  def find_directory
    @directory = Directory.find(params[:directory_id]) if params[:directory_id]
  end

  def find_item
    @item = Item.find(params[:id]) if params[:id]
  end

  def item_params
    params.require(:item).permit(:id, :file, labels_attributes: [:id, :name, :_destroy])
  end
end
