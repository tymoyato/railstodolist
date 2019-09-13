class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
  end

  def new
    @category = Category.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to new_category_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    if @category.present?
      @category.destroy
    end
    redirect_to new_category_path
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update_attributes(category_params)
      redirect_to new_category_path
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end
