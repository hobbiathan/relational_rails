class CountriesController < ApplicationController
  def index
    @countries = Country.desc_order
  end

  def show
    @current_country = Country.find(params[:id])
    @warrooms = @current_country.warrooms
  end

  def new
  end

  def create

  end


end
