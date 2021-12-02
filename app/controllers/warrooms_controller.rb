class WarroomsController < ApplicationController
  def index
    @warrooms = Warroom.all
  end
end
