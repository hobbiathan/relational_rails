require 'rails_helper'

RSpec.describe 'country_warrooms#new' do
  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
  end

  it 'links to /new from /countries/:id' do
    visit "/countries/#{@country.id}"

    click_button("Create Warroom")
    expect(current_path).to eq("/countries/#{@country.id}/new")
  end
end
