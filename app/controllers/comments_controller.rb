class CommentsController < ApplicationController

  before_action :set_item, only: [:create, :destroy]

  def create
    
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@item)
    else
      redirect_to item_path(@item), flash: { alert: "コメントに失敗しました"}
    end
    
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to item_path(@item)
    else
      redirect_to item_path(@item), flash: { alert: "削除に失敗しました"}
    end
  end

  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
