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
    company = Company.create({
      name: params[:name],
      games_invented: params[:games_invented],
      independent: params[:independent]
      })
      
      redirect_to '/companies'
  end

end
