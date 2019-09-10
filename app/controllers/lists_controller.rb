class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find_by(id: params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new

    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
  end
end
