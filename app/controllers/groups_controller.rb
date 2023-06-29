class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      @group.users << current_user
      flash[:success] = "You succeeded in creating new group!"
      redirect_to @group
    else
      render "new", status: :unprocessable_entity
    end
  end


  private
    def group_params
      params.require(:group).permit(:name)
    end
end
