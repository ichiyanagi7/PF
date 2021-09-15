class HomesController < ApplicationController
  def top
    if user_signed_in?
    user_ids=current_user.followings.pluck(:id)
    @mysteries=Mystery.where(user_id: user_ids).order(created_at: :desc)
    else
      @mysteries=Mystery.all
    end
  end

  def about
  end
end
