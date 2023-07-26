class MemosController < ApplicationController
  before_action :group_member, only: [:index]

  def create
    @group = Group.find(params[:group_id])
    @memo = @group.memos.new(memo_params)
    @memo.user_id = current_user.id
    @memo.group_id = @group.id
    # あとでmemo_dateを保存する記述を追加
    @memo.memo_date = params[:memo][:memo_date].to_date
    # @memos = @group.memos.where(memo_date: params[:memo][:memo_date].to_date)
    if @memo.save
      flash[:success] = "You succeeded in creating new memo!"
      redirect_to group_memo_path(@group, @memo)
    else
      render "index", status: :unprocessable_entity
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def index
    @group = Group.find(params[:group_id])
    @date = params[:memo_date]
    @memos = @group.memos.where(memo_date: @date.to_date)
    @memo = @group.memos.new
  end


  private
    def memo_params
      params.require(:memo).permit(:title, :description)
    end

    def group_member
      @group = Group.find(params[:group_id])
      redirect_to(root_url, status: :see_other) unless @group.users.include?(current_user)
    end
end
