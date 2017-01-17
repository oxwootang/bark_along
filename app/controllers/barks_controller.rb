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
  end

  def show
    @bark = Bark.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def bark_params
      params.require(:bark).permit(:title, :location, :content)
    end
end
