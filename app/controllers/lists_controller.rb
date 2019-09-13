class ListsController < ApplicationController
  def index
    @lists = List.includes(:items).where(user_id: current_user.id).all
  end

  def show
    @list = List.find_by(id: params[:id])
    @category = Category.find(@list.category_id)
  end

  def new
    @list = List.new
    @lists = List.where(user_id: current_user.id)
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to new_list_path
    else
      render 'new'
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list.update_attributes(list_params)
      redirect_to new_list_path
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find_by(id: params[:id])
    if @list.present?
      @list.destroy
    end
    redirect_to new_item_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :category_id, :user_id)
  end
end
