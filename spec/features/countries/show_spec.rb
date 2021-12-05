require 'rails_helper'

RSpec.describe 'countries' do
  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)
    @wr = @country.warrooms.create!(strategic_importance: 5, warroom_name: "Sector 2B", deadman_switch: true, contains_wmd: true)
    @wr_2 = @country_two.warrooms.create!(strategic_importance: 4, warroom_name: "Khoslin", deadman_switch: false, contains_wmd: true)
  end

  it 'Can display links to parent and relevant child table' do
    visit "/countries/#{@country.id}"

    expect(page).to have_link("Countries Index", :href => "/countries")
    expect(page).to have_link("All Country Warrooms", :href => "/countries/#{@country.id}/warrooms")
  end

  it 'Can display country and its relevant children' do

    visit "/countries/#{@country.id}"

    #save_and_open_page

    expect(page).to have_content(@country.country_name)
    expect(page).to have_content(@wr.warroom_name)
    expect(page).to have_content(@country.warrooms.count)

    visit "/countries/#{@country_two.id}"

    #save_and_open_page

    expect(page).to have_content(@country_two.country_name)
    expect(page).to have_content(@wr_2.warroom_name)
    expect(page).to have_content(@country_two.warrooms.count)

  end

end
