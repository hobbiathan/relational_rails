require 'rails_helper'

RSpec.describe 'countries' do

  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)
  end

  it 'Lists and links to all Countries' do

    visit "/countries"

    #save_and_open_page

    expect(page).to have_content(@country.country_name)
    expect(page).to have_content(@country_two.country_name)
    expect(page).to have_link("#{@country.country_name}", :href => "/countries/#{@country.id}")
    expect(page).to have_link("#{@country_two.country_name}", :href => "/countries/#{@country_two.id}")
    expect(page).to have_link("All Warrooms", :href => "/warrooms")

  end

end
