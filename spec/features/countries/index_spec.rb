require 'rails_helper'

RSpec.describe 'countries' do

  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)

    visit "/countries"
  end

  it 'Lists all countries' do

    expect(page).to have_content(@country.country_name)
    expect(page).to have_content(@country_two.country_name)

  end

  it 'links to respective countries' do
    expect(page).to have_link("#{@country.country_name}", :href => "/countries/#{@country.id}")
    expect(page).to have_link("#{@country_two.country_name}", :href => "/countries/#{@country_two.id}")
  end

  it 'links to all warrooms' do
    expect(page).to have_link("All Warrooms", :href => "/warrooms")
  end

  it 'contains link to create new parent' do
    expect(page).to have_link("New Parent", :href => "/countries/new")
  end

end
