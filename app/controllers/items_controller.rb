class ItemsController < ApplicationController
  def new
    @item = Item.new
    @items = Item.where(user_id: current_user.id)
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to new_item_path
    else
      render 'new'
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    if @item.present?
      @item.destroy
    end
    redirect_to new_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :list_id, :user_id)
  end
end
