class Admins::UsersController < ApplicationController
  def index
    @users=User.page(params[:page]).per(10)
    @user_all=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end


  def update
    user=User.find(params[:id])
    user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:is_deleted)
  end

end
