class DirectoriesController < ApplicationController

  before_filter :find_directory

  def index
    @directories = Directory.order(created_at: :desc)
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
    if @directory.save
      redirect_to directories_path
    else
      render :new
    end
  end

  def update
    if @directory.update(directory_params)
      redirect_to directories_path
    else
      render :edit
    end
  end

  def destroy
    @directory.destroy
    redirect_to directories_path
  end

  private

  def find_directory
    @directory = Directory.find(params[:id]) if params[:id]
  end

  def directory_params
    params.require(:directory).permit(:name, :description)
  end

end
