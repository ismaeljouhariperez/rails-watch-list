class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit]
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def delete
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name)
  end
end
