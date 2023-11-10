class ArchivesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @pagy, @archives = pagy(@group.archives)
  end

  def show
    @archive = Archive.find(params[:id])
    @group = Group.find(params[:group_id])
  end
end
