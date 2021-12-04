class CompaniesController < ApplicationController

  def index
    @companies = Company.all

  end

  def show
    @company = Company.find(params[:id])
  end

  # def new
  #
  # end

  def create
    company = Company.create(companies_params)

      redirect_to '/companies'
  end

  def companies_params
    params.permit(:name, :games_invented, :independent)
  end


end
