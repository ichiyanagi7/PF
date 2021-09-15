class MysteriesController < ApplicationController
  def index
    @mysteries=Mystery.all
    @genres=Genre.all
  end

  def show
    @mystery=Mystery.find(params[:id])
  end

  def new
    @mystery=Mystery.new
  end

  def create
    mystery=Mystery.new(mystery_params)
    mystery.user_id=current_user.id
    mystery.save
    redirect_to mystery_path(mystery)
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
    @review=Review.new
  end

  private

  def mystery_params
    params.require(:mystery).permit(:user_id ,:genre_id,:title,:question,:question_image,:answer,:description,:answer_image,:hint)
  end

end
