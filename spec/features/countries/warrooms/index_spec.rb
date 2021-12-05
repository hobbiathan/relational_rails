require 'rails_helper'

RSpec.describe 'country_warrooms#' do

  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)
    @wr = @country.warrooms.create!(strategic_importance: 5, warroom_name: "Sector 2B", deadman_switch: true, contains_wmd: true)
    @wr_2 = @country_two.warrooms.create!(strategic_importance: 4, warroom_name: "Khoslin", deadman_switch: false, contains_wmd: true)
  end

  it 'can view all warrooms of a given country' do
    visit "/countries/#{@country.id}/warrooms"

    expect(page).to have_content(@country.country_name)
    expect(page).to have_content(@wr.warroom_name)
    expect(page).to have_content(@wr.strategic_importance)
    expect(page).to have_content(@wr.deadman_switch)
    expect(page).to have_content(@wr.contains_wmd)
    expect(page).to have_link("Return to Country", :href => "/countries/#{@country.id}")

    visit "/countries/#{@country_two.id}/warrooms"

    expect(page).to have_content(@country_two.country_name)
    expect(page).to have_content(@wr_2.warroom_name)
    expect(page).to have_content(@wr_2.strategic_importance)
    expect(page).to have_content(@wr_2.deadman_switch)
    expect(page).to have_content(@wr_2.contains_wmd)
    expect(page).to have_link("Return to Country", :href => "/countries/#{@country_two.id}")

  end

end
