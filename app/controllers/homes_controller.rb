class HomesController < ApplicationController
  def top
    user_ids=current_user.followings.pluck(:id)
    @mysteries=Mystery.where(user_id: user_ids).order(created_at: :desc)
  end

  def about
  end
end
