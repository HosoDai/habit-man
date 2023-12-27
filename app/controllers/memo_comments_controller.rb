class MemoCommentsController < ApplicationController
  before_action :correct_memo_comment_user, only: [:destroy]

  def create
    @memo = Memo.find(params[:memo_id])
    @group = Group.find(params[:group_id])
    @comment = current_user.memo_comments.new(memo_comment_params)
    @comment.memo_id = @memo.id
    if @comment.save
      flash[:success] = "You succeeded in creating new comment!"
      redirect_to group_memo_path(@group, @memo)
    else
      @memo_comment = @comment
      render "memos/show", status: :unprocessable_entity
    end
  end

  def destroy
    MemoComment.find(params[:id]).destroy
    flash[:success] = "comment deleted"
    redirect_to group_memo_path(params[:group_id], params[:memo_id]), status: :see_other
  end


  private
    def memo_comment_params
      params.require(:memo_comment).permit(:comment)
    end

    def correct_memo_comment_user
      redirect_to(root_url, status: :see_other) unless MemoComment.find(params[:id]).user == current_user
    end
end
