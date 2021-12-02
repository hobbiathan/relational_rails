class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    #binding.pry
    @current_country = Country.find(params[:id])
    #binding.pry
    @warrooms = @current_country.warrooms
    #binding.pry
  end

# Not dry - how to utilize show method for nested page?
  def warrooms
    @current_country = Country.find(params[:id])
    @warrooms = @current_country.warrooms
  end

  def child_warroom

  end
end
