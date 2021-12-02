class CompanyBoardgamesController < ApplicationController
  def index
    company = Company.find(params[:company_id])
    @boardgames = company.boardgames
  end
end
