class CountriesController < ApplicationController
  def index
    @countries = Country.desc_order
    #binding.pry
  end

  def show
    #binding.pry
    @current_country = Country.find(params[:id])
    #binding.pry
    @warrooms = @current_country.warrooms
    #binding.pry
  end

# # Not dry - how to utilize show method for nested page?
#   def warrooms
#     @current_country = Country.find(params[:id])
#     @warrooms = @current_country.warrooms
#   end
#
#   # same thing as above
#   # does this follow that one thing that says information shouldn't be accessible
#   # from foreign parents?
#
#   # probably not
#
#
#   def child_warroom
#     #binding.pry
#     @current_country = Country.find(params[:id])
#     @warroom = Warroom.find(params[:warroom_id])
#     #binding.pry
#   end
end
