class GroupsController < ApplicationController
  before_action :group_member, only: [:show]
  before_action :correct_group_owner, only: [:edit, :update]

  def index
    @groups = current_user.groups
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @memos = @group.memos
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
      flash[:success] = "Group infromation updated"
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
      redirect_to @group
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


  private
    def group_params
      params.require(:group).permit(:name)
    end

    def group_member
      @group = Group.find(params[:id])
      redirect_to(root_url, status: :see_other) unless @group.users.include?(current_user)
    end

    def correct_group_owner
      @group = Group.find(params[:id])
      redirect_to(root_url, status: :see_other) unless @group.owner_id == current_user.id
    end
end
