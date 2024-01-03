class GroupsController < ApplicationController
  before_action :group_member, only: [:show]
  before_action :correct_group_owner, only: [:edit, :update]
  before_action :set_biginning_of_week


  def index
    @groups = current_user.groups
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @memo = @group.memos.new
    @pagy, @memos = pagy(@group.memos.order(updated_at: :desc).limit(20))
    if params[:key_word]
      # @pagy, @memos = pagy(@memos.tagged_with(params[:key_word]).limit(20))
      @pagy, @memos = pagy(@memos.where("title LIKE ?", "%#{params[:key_word]}%"))
      unless @memos.present?
        @pagy, @memos = pagy(@group.memos.tagged_with(params[:key_word]))
      end
    end
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @groups = current_user.groups
    if @group.save
      @group.users << current_user
      flash[:success] = "You succeeded in creating new group!"
      redirect_to @group
    else
      render "index", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:success] = "Group information updated"
      redirect_to @group
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def invite
    @user = User.find_by(email: params[:group][:email].downcase)
    @group = Group.find(params[:group_id])
    @members = @group.users
    # 招待したメールアドレスがユーザーデータベースに存在すれば招待メールを送信
    if @user
      GroupMailer.invite_member(@group, @user).deliver_now
      flash[:success] = "You succeeded in inviting new member!"
      # redirect_to @group
      redirect_back(fallback_location: group_member_path(@group))
    else
      flash.now[:danger] = "Invalid email or Not registered email"
      render "member", status: :unprocessable_entity
    end
  end

  def join
    user = User.find(params[:user])
    reset_session
    log_in user
    @group = Group.find(params[:group_id])
    if @group.users.exclude?(user)
      @group.users << user
      flash[:success] = "You succeeded in joing a group!"
      redirect_to group_path(@group)
    else
      redirect_to group_path(@group)
      flash[:warning] = "You have already joined this group"
    end
  end

  def member
    @group = Group.find(params[:group_id])
    @members = @group.users
  end

  def calendar
    @group = Group.find(params[:group_id])
    @memos = @group.memos
  end

  # def archive
  #   @group = Group.find(params[:group_id])
  #   @pagy, @archives = pagy(@group.memos.where('updated_at < ?', 2.weeks.ago))
  #   @pagy, @archives = pagy(ViewCount.where('created_at < ?', 2.weeks.ago))
  # end


  private
    def group_params
      params.require(:group).permit(:name, :image)
    end

    def group_member
      @group = Group.find(params[:id])
      redirect_to(root_url, status: :see_other) unless @group.users.include?(current_user)
    end

    def correct_group_owner
      @group = Group.find(params[:id])
      redirect_to(root_url, status: :see_other) unless @group.owner_id == current_user.id
    end

    def set_biginning_of_week
      Date.beginning_of_week = :sunday
    end
end
