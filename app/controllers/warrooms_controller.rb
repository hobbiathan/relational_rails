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

  def update
    #binding.pry
    current_warroom = Warroom.find(params[:id])
    current_warroom.update(warroom_params)

    redirect_to "/warrooms/#{current_warroom.id}"
  end

  def warroom_params
    params.permit(:warroom_name, :strategic_importance, :deadman_switch, :contains_wmd)
  end
end
