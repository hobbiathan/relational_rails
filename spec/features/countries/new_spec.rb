require 'rails_helper'

RSpec.describe 'countries' do
  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @country_two = Country.create!(military_power_rank: 4, country_name: "Enoi", nuclear_power: true)
  end

  
end
