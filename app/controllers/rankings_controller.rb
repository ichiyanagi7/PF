class RankingsController < ApplicationController
  def index
    # Mystery モデルからfavorited_usersの多い順に並び替え、先頭から10個取り出す
    @mysteries=Mystery.includes(:favorited_users).sort {|a,b|b.favorited_users.size <=> a.favorited_users.size}.first(10)
    @users=User.includes(:mysteries).sort{|a,b|b.mysteries.size <=> a.mysteries.size}.first(10)
  end
end
