class CompanyBoardgamesController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @boardgames = @company.boardgames
    if params[:order] == "name"
      @boardgames = @boardgames.alphabetical
    elsif params[:rank].to_i > 0
      @boardgames = @boardgames.limit_by_rank(params[:rank].to_i)
   end
  end
  def new
    @company = Company.find(params[:company_id])
  end
  def create
    @company = Company.find(params[:company_id])
    @company.boardgames.create(boardgames_params)
    redirect_to "/companies/#{@company.id}/boardgames"
  end
private

  def boardgames_params
    params.permit(:name, :rank, :out_of_print)
  end
end
