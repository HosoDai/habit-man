class MemoCommentsController < ApplicationController
  def create
    memo = Memo.find(params[:memo_id])
    group = Group.find(params[:group_id])
    comment = current_user.memo_comments.new(memo_comment_params)
    comment.memo_id = memo.id
    if comment.save
      flash[:success] = "You succeeded in creating new comment!"
      redirect_to group_memo_path(group, memo)
    else
    end
  end

  def destroy

  end


  private
    def memo_comment_params
      params.require(:memo_comment).permit(:comment)
    end
end
