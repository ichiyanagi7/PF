class ApplicationController < ActionController::Base
  # 管理者orユーザー区別
  def authenticate_any!
    if admin_signed_in?
        true
    else
        authenticate_user!
    end
  end
end
