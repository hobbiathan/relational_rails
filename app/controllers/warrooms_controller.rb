class WarroomsController < ApplicationController
  def index
    @warrooms = Warroom.all
  end

  def show
    @current_warroom = Warroom.find(params[:id])
  end

  def edit
    @current_warroom = Warroom.find(params[:id])
  end
end
