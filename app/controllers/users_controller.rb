class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @mysteries=@user.mysteries
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:email,:name,:introduction,:image,:is_deleted)
  end

end
