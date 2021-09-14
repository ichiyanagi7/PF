class FavoritesController < ApplicationController
  def index
    @user=User.find(params[:user_id])
    favorites=@user.favorites.pluck(:mystery_id)
    @mysteries=Mystery.where(id: favorites)
    @genres=Genre.all
  end


  def create
    mystery=Mystery.find(params[:mystery_id])
    favorite=current_user.favorites.new(mystery_id: mystery.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    mystery=Mystery.find(params[:mystery_id])
    favorite=current_user.favorites.find_by(mystery_id: mystery.id)
    favorite.destroy
    redirect_to request.referer
  end

end
