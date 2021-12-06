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
    #binding.pry
    #binding.pry
    nuclear_conversion = nil

    if params[:nuclear_power] == "true"
      nuclear_conversion = true
    end

    if params[:nuclear_power] == "false"
      nuclear_conversion = false
    end

    country = Country.create({
      country_name: params[:country_name],
      nuclear_power: nuclear_conversion,
      military_power_rank: params[:military_power_rank]
      })

    redirect_to '/countries'
  end
end
