class BoardgamesController < ApplicationController
 def index
   @boardgames = Boardgame.all
 end

 def show
   @boardgame = Boardgame.find(params[:id])
  end

  def edit
    @boardgame = Boardgame.find(params[:id])
  end

  def update
    @boardgame = Boardgame.find(params[:id])
    @boardgame.update(boardgames_params)
    redirect_to "/boardgames/#{@boardgame.id}"
  end

  def boardgames_params
    params.permit(:name, :rank, :out_of_print)
  end
end
