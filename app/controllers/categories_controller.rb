class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end
end
