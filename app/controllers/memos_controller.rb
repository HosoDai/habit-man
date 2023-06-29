class MemosController < ApplicationController

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id
    # あとで修正
    @memo.group_id = session[:group_id]
    if @memo.save
      flash[:success] = "You succeeded in creating new memo!"
      redirect_to @memo
    else
      render "index", status: :unprocessable_entity
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def index
    @memo = Memo.new
    @memos = Memo.all
  end


  private
    def memo_params
      params.require(:memo).permit(:attendance_status, :reason)
    end
end
