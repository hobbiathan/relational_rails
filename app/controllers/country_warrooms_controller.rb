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
end
