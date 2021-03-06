class DirectoriesController < ApplicationController

  before_filter :find_directory
  before_filter :authorize_directory

  def index
    @directories = current_user.directories.order(created_at: :desc)
  end

  def show

  end

  def new
    @directory = Directory.new
  end

  def edit

  end

  def create
    @directory = Directory.new(directory_params)
    @directory.user = current_user
    if @directory.save
      track('directory:created', @directory)
      redirect_to directories_path
    else
      render :new
    end
  end

  def update
    if @directory.update(directory_params)
      track('directory:updated', @directory)
      redirect_to directory_path(@directory)
    else
      render :edit
    end
  end

  def destroy
    directory = @directory
    @directory.destroy
    track('directory:destroyed', directory)
    redirect_to directories_path
  end

  private

  def track(event, directory)
    ahoy.track event, {directory: { id: directory.id, name: directory.name }}
  end

  def find_directory
    @directory = Directory.find(params[:id]) if params[:id]
  end

  def authorize_directory
    authorize @directory if @directory
  end

  def directory_params
    params.require(:directory).permit(:name, :description, directory_permissions_attributes: [:id, :user_id, :_destroy],
                                      items_attributes: [:id, :_destroy])
  end

end
