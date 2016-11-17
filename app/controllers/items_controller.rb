class ItemsController < ApplicationController
  before_filter :find_directory
  before_filter :find_item

  def new
    @item = Item.new
  end

  def create
    @item = @directory.items.create(item_params)
    track('file:created', @item)
    render partial: 'items/ajax_item', locals: {item: @item}
  end

  def destroy
    destoryed_item = @item
    @item.destroy
    track('file:destroyed', destoryed_item)
    redirect_to directory_path(@directory)
  end

  private

  def track(event, item)
    ahoy.track event, {id: item.id, title: File.basename(item.file.path)}
  end

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
