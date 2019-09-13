class PagesController < ApplicationController
  def home
  end

  def archived
    @lists = List.includes(:items).where(user_id: current_user.id)
  end
end
