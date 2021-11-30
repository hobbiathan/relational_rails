class CompaniesController < ApplicationController

  def index
    @companies =['company_1', 'company_2', 'company_3']
  end

  def show
    company = Company.find(params[:id])
  end

end
