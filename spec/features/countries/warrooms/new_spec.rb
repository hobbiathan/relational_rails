require 'rails_helper'

RSpec.describe 'country_warrooms#new' do
  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @country_2 = Country.create!(military_power_rank: 5, country_name: "The Hobbiathan", nuclear_power: true)

  end

  it 'links to /new from /countries/:id' do
    visit "/countries/#{@country.id}/warrooms"

    click_button("Create Warroom")
    expect(current_path).to eq("/countries/#{@country.id}/warrooms/new")
  end

  it 'can create a new warroom tied to a specific country' do

    visit "/countries/#{@country.id}/warrooms/new"

    fill_in(:warroom_name, with: "Sector 2B")
    fill_in(:strategic_importance, with: '5')
    fill_in(:deadman_switch, with: "true")
    fill_in(:contains_wmd, with: "false")

    click_button('Create Warroom')

    expect(current_path).to eq("/countries/#{@country.id}/warrooms")
    expect(page).to have_content("Sector 2B")
    expect(page).to have_content("5")
    expect(page).to have_content("true")
    expect(page).to have_content("false")

    visit "/countries/#{@country_2.id}/warrooms/new"

    fill_in(:warroom_name, with: "Sector 2A")
    fill_in(:strategic_importance, with: '3')
    fill_in(:deadman_switch, with: "false")
    fill_in(:contains_wmd, with: "true")

    click_button('Create Warroom')

    expect(current_path).to eq("/countries/#{@country_2.id}/warrooms")
    expect(page).to have_content("Sector 2A")
    expect(page).to have_content("3")
    expect(page).to have_content("false")
    expect(page).to have_content("true")


    #save_and_open_page
  end
end
