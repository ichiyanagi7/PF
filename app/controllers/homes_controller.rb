class HomesController < ApplicationController
  def top
    if user_signed_in?
      user_ids=current_user.followings.pluck(:id)
      @mysteries=Mystery.where(user_id: user_ids).order(created_at: :desc).page(params[:page]).per(9)
    else
      @mysteries=Mystery.all.order(created_at: :desc).first(6)
    end
  end

  def about
  end
end
