class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @value = params["search"]["value"] #ジャンル名
    @datas = search_for(@value) #ジャンルで検索した謎
    @genres = Genre.all
    @mysteries = Mystery.where(status: "published")
  end

  private

  def search_for(value)
    genre(value)
  end

  def genre(value)
    genre = Genre.find_by(name: value)
    Mystery.where(genre_id: genre.id,status: "published")
  end

end
