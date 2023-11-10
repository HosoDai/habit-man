class MemosController < ApplicationController
  before_action :group_member, only: [:index, :show]
  before_action :correct_memo_user, only: [:edit, :update, :destroy]

  def create
    @group = Group.find(params[:group_id])
    @memo = @group.memos.new(memo_params)
    @date = params[:memo][:memo_date]
    @memo.user_id = current_user.id
    @memo.group_id = @group.id
    # あとでmemo_dateを保存する記述を追加
    @memo.memo_date = params[:memo][:memo_date].to_date
    @pagy, @memos = pagy(@group.memos.where(memo_date: params[:memo][:memo_date].to_date))
    if @memo.save
      # グループメンバーにメールで通知をする
      NotificationMailer.notification_for_member(@memo, @group).deliver_now
      # フラッシュメッセージ
      flash[:success] = "You succeeded in creating new memo!"
      redirect_to group_memo_path(@group, @memo)
      # redirect_back(fallback_location: group_memos_path(@group))
    else
      render "index", status: :unprocessable_entity
    end
  end

  def show
    @memo = Memo.find(params[:id])
    @group = Group.find(params[:group_id])
    unless ReadCount.find_by(user_id: current_user.id, memo_id: @memo.id)
      current_user.read_counts.create(memo_id: @memo.id)
    end
    current_user.view_counts.create(memo_id: @memo.id)
    @memo.update_attribute(:accessed_at, DateTime.current)
  end

  def index
    @group = Group.find(params[:group_id])
    @date = params[:memo_date]
    @pagy, @memos = pagy(@group.memos.where(memo_date: @date.to_date).order(updated_at: :desc))
    @memo = @group.memos.new
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      flash[:success] = "memo information updated"
      redirect_to group_memo_path(@group, @memo)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    date = @memo.memo_date
    @memo.destroy
    flash[:success] = "memo deleted"
    redirect_to group_memos_path(@group, memo_date: date), status: :see_other
  end

  def download
    file = Memo.find(params[:memo_id]).memo_file
    unless file.blank?
      file_path = file.current_path
      send_file(file_path)
    end
  end


  private
    def memo_params
      params.require(:memo).permit(:title, :description, :memo_date, :tag_list, :memo_file)
    end

    def group_member
      @group = Group.find(params[:group_id])
      redirect_to(root_url, status: :see_other) unless @group.users.include?(current_user)
    end

    def correct_memo_user
      @memo = Memo.find(params[:id])
      @group = Group.find(params[:group_id])
      redirect_to(root_url, status: :see_other) unless @memo.user == current_user
    end

    # def automatic_tagging

    # end
end
