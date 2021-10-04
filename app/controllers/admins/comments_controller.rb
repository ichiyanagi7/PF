class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments=Comment.all
  end

end
