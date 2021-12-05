class CountryWarroomsController < ApplicationController
  def index
    @current_country = Country.find(params[:id])
    @warrooms = @current_country.warrooms
  end

end
