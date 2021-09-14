class SearchesController < ApplicationController
  def search
    @value = params["search"]["value"] #ジャンル名
    @how = params["search"]["how"] #ジャンル
    @datas = search_for(@how, @value) #ジャンルで検索した謎
    @genres=Genre.all
    @mysteries=Mystery.all
  end

  private

  def search_for(how, value)
    case how
    when 'genre'
      genre(value)
    end
  end
  
  def genre(value)
    @genre = Genre.find_by(name: value)
    Mystery.where(genre_id: @genre.id)
  end

end
