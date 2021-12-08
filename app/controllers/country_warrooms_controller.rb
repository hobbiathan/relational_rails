class CountryWarroomsController < ApplicationController
  def index
    if params["order"] == "warroom_name"
      @current_country = Country.find(params[:id])
      #binding.pry
      @warrooms = @current_country.warrooms.all.order(warroom_name: :asc)

    else
      @current_country = Country.find(params[:id])
      @warrooms = @current_country.warrooms.all
    end

    if params[:x] == "1" || params[:x] == "2" || params[:x] == "3" || params[:x] == "4" || params[:x] == "5"
      @warrooms = @current_country.warrooms.importance_filter(params[:x])
    end

  end

  def show
      @current_country = Country.find(params[:id])
      @warroom = Warroom.find(params[:warroom_id])
  end

  def new
    #binding.pry
    @current_country = Country.find(params[:id])
  end

  def edit
    #binding.pry
    @current_country = Country.find(params[:id])
    @current_warroom = Warroom.find(params[:warroom_id])
  end

  def update
    #binding.pry
    current_country = Country.find(params[:id])
    current_warroom = Warroom.find(params[:warroom_id])
    current_warroom.update(warroom_params)

    redirect_to "/countries/#{current_country.id}/warrooms/#{current_warroom.id}"
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


  private
  def warroom_params
    params.permit(:warroom_name, :strategic_importance, :deadman_switch, :contains_wmd)
  end
end
