class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @current_country = Country.find(params[:id])
  end
end
