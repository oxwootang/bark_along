class BarksController < ApplicationController

  def index
    @barks = Bark.all
  end

  def create
    @bark = Bark.new(bark_params)
    if @bark.save
      redirect_to root_path
    else
      redirect_to new_bark_path
    end
  end

  def new
    @bark = Bark.new
  end

  def edit
    find_bark
  end

  def show
    find_bark
  end

  def update
    find_bark
    if @bark.update_attributes(bark_params)
      redirect_to bark_path(params[:id])
    else
      redirect_to edit_bark_path(params[:id])
    end
  end

  def destroy
    find_bark
    @bark.destroy
    redirect_to root_path
  end

  private
    def bark_params
      params.require(:bark).permit(:title, :location, :content)
    end

    def find_bark
      @bark = Bark.find(params[:id])
    end
end
