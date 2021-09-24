class MysteriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @mysteries=Mystery.where(status: "published").order(created_at: :desc)
    @genres=Genre.all
    @tags=Mystery.tag_counts_on(:tags).order("count DESC")
    # タグ検索用
    if @tag=params[:tag]
      @tag_mysteries=Mystery.tagged_with(params[:tag])
    end
  end

  def show
    @mystery=Mystery.find(params[:id])
    @tags=@mystery.tag_counts_on(:tags)
  end

  def new
    @mystery=Mystery.new
  end

  def create
    mystery=Mystery.new(mystery_params)
    mystery.user_id=current_user.id
    if mystery.save
      redirect_to mystery_path(mystery)
    else
      @mystery=mystery
      render :new
    end
  end

  def edit
    @mystery=Mystery.find(params[:id])
  end

  def update
    mystery=Mystery.find(params[:id])
    mystery.update(mystery_params)
    redirect_to mystery_path(mystery)
  end

  def destroy
    mystery=Mystery.find(params[:id])
    mystery.destroy
    redirect_to request.referer
  end

  def answer
    @mystery=Mystery.find(params[:id])
    @comment=Comment.new
  end

  private

  def mystery_params
    params.require(:mystery).permit(:user_id ,:genre_id,:title,:question,:question_image,:answer,:description,:answer_image,:hint,:tag_list,:name,:status,:published_at)
  end

end
