class ListsController < ApplicationController
  def index
    @lists = List.includes(:items).where(user_id: current_user.id)
  end

  def show
    @list = List.find_by(id: params[:id])
    @category = Category.find(@list.category_id)
  end

  def new
    @list = List.new
    @lists = List.where(user_id: current_user.id)
    @users = User.all
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to new_list_path
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
      ModelMailer.new_record_notification(@list, current_user).deliver_now
      @list.destroy
    end
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :category_id, :user_id, :shared_id)
  end
end
