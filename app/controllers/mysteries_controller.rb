class MysteriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @mystery=Mystery.new
  end

  def create
    mystery=Mystery.new(mystery_params)
    mystery.save
    redirect_to mystery_path(mystery)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def answer
  end

  private

  def mystery_params
    params.require(:mystery).permit(:user_id ,:genre_id,:title,:question,:question_image,:answer,:description,:answer_image,:hint)
  end

end
