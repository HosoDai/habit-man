class ArchivesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @pagy, @archives = pagy(@group.archives.order(memo_date: :desc))
    if params[:key_word]
      @pagy, @archives = pagy(@archives.where("title LIKE ?", "%#{params[:key_word]}%"))
      unless @archives.present?
        @pagy, @archives = pagy(@group.archives.tagged_with(params[:key_word]))
      end
    end
  end

  def show
    @archive = Archive.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def download
    file = Archive.find(params[:archive_id]).memo_file
    unless file.blank?
      file_path = file.current_path
      send_file(file_path)
    end
  end
end
