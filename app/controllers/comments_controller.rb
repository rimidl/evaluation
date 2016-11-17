class CommentsController < ApplicationController
  before_action :find_item, only: :create

  def create
    @item.comments.create(comment_params.merge(user: current_user))
    redirect_to :back
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
