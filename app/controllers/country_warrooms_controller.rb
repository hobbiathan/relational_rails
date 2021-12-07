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

    deadman = nil
    wmd = nil

    if params[:deadman_switch] == "true"
      deadman = true
    end

    if params[:deadman_switch] == "false"
      deadman = false
    end

    if params[:contains_wmd] == "true"
      wmd = true
    end

    if params[:contains_wmd] == "false"
      wmd = false
    end

    current_country = Country.find(params[:id])
    country_warroom = current_country.warrooms.create(warroom_name: params[:warroom_name], strategic_importance: params[:strategic_importance], deadman_switch: deadman, contains_wmd: wmd)

    redirect_to "/countries/#{current_country.id}/warrooms"
  end

  def destroy
    current_country = Country.find(params[:id])

    warroom = Warroom.find(params[:warroom_id])

    warroom.destroy 

    redirect_to "/countries/#{current_country.id}/warrooms"
  end

end
