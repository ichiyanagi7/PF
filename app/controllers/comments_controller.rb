class CommentsController < ApplicationController
  before_action :authenticate_any!,only:[:destroy]

  def create
    mystery=Mystery.find(params[:mystery_id])
    comment=current_user.comments.new(comment_params)
    comment.mystery_id=mystery.id
    comment_count=Comment.where(mystery_id: params[:mystery_id],user_id: current_user.id).count
    # APIスコア付け
    comment.score=Language.get_data(comment_params[:comment])
    if comment_count < 1
      if comment.save
        redirect_to mystery_path(mystery),notice: "レビューを投稿しました!"
      else
        redirect_to request.referer,notice: "投稿に失敗しました。もう一度お願いします。"
      end
    else
      redirect_to request.referer,notice: "すでにレビューしています。"
    end
  end

  def edit
    @mystery=Mystery.find(params[:mystery_id])
    @comment=Comment.find_by(mystery_id: params[:mystery_id],id: params[:id])
  end

  def update
    comment=Comment.find_by(mystery_id: params[:mystery_id],id: params[:id])
    comment.score=Language.get_data(comment_params[:comment])
    comment.update(comment_params)
    redirect_to mystery_path(comment.mystery)
  end

  def destroy
    comment=Comment.find_by(mystery_id: params[:mystery_id],id: params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id,:mystery_id,:comment,:rate,:score)
  end

end
