class PagesController < ApplicationController
  def home
  end

  def archived
    @lists = List.includes(:items).where(user_id: current_user.id)
  end

  def shared
    @lists = List.includes(:items).where(user_id: current_user.id).or(List.includes(:items).where(shared_id: current_user.id))
  end
end
