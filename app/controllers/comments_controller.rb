class CommentsController < ApplicationController
  def create
    mystery=Mystery.find(params[:mystery_id])
    comment=current_user.comments.new(comment_params)
    comment.mystery_id=mystery.id
    comment.save
    redirect_to mystery_path(mystery)
  end

  def edit
    @mystery=Mystery.find(params[:mystery_id])
    @comment=Comment.find_by(mystery_id: params[:mystery_id],id: params[:id])
  end

  def update
    comment=Comment.find_by(mystery_id: params[:mystery_id],id: params[:id])
    comment.update(comment_params)
    redirect_to mystery_path(comment.mystery)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id,:mystery_id,:comment)
  end

end
