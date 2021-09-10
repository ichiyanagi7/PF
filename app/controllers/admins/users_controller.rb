class Admins::UsersController < ApplicationController
  def index
    @users=User.page(params[:page]).per(10)
    @user_all=User.all
  end

  def show
  end

  def update
  end
end
