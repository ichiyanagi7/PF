class RankingsController < ApplicationController
  before_action :authenticate_user!

  def index
    # User.is_deleted: false のデータ
    user_select= User.where(is_deleted: false)
    # Mystery.status: published のデータ
    mystery_select=Mystery.where(status: "published")
    # 上2つを合わせたデータ
    mysteries=mystery_select.where(user_id: user_select.ids)
    # Mystery モデルからfavorited_usersの多い順に並び替え、先頭から10個取り出す
    @mysteries=mysteries.includes(:favorited_users).sort {|a,b|b.favorited_users.size <=> a.favorited_users.size}.first(10)

    # 退会していないuserからmysteryの多い順に10個取り出す
    @users=user_select.includes(:mysteries).sort{|a,b|b.mysteries.size <=> a.mysteries.size}.first(10)
  end
end
