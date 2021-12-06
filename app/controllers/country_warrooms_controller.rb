class CountryWarroomsController < ApplicationController
  def index
    @current_country = Country.find(params[:id])
    @warrooms = @current_country.warrooms
  end

  def show
    #binding.pry
    @current_country = Country.find(params[:id])
    @warroom = Warroom.find(params[:warroom_id])
    #binding.pry
  end

  def new
    #binding.pry
    @current_country = Country.find(params[:id])
  end

  def create
    current_country = Country.find(params[:id])
    country_warroom = current_country.warrooms.create(warroom_name: params[:warroom_name], strategic_importance: params[:strategic_importance], deadman_switch: params[:deadman_switch], contains_wmd: params[:contains_wmd])

    redirect_to "/countries/#{current_country.id}/warrooms"
  end

  def country_warroom_params
    params.permit(:warroom_name, :strategic_importance, :deadman_switch, :contains_wmd)
  end
end
