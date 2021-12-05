class CountriesController < ApplicationController
  def index
    @countries = Country.desc_order
    #binding.pry
  end

  def show
    #binding.pry
    @current_country = Country.find(params[:id])
    #binding.pry
    @warrooms = @current_country.warrooms
    #binding.pry
  end

end
