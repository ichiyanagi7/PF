class RankingsController < ApplicationController
  def index
    @mysteries=Mystery.includes(:favorited_users).sort {|a,b|b.favorited_users.size <=> a.favorited_users.size}
    @users=User.all
  end
end
