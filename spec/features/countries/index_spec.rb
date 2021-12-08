require 'rails_helper'

RSpec.describe 'countries' do

  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)
    @wr = @country.warrooms.create!(strategic_importance: 5, warroom_name: "Sector 2B", deadman_switch: true, contains_wmd: true)
    @wr_2 = @country.warrooms.create!(strategic_importance: 3, warroom_name: "Sector 2C", deadman_switch: true, contains_wmd: true)

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
    expect(page).to have_link("Create Country", :href => "/countries/new")
  end

  it 'can click the organize link' do
    visit "/countries/#{@country.id}/warrooms"
    click_link("Order by Name")

    expect(page).to have_content("Sector 2B")
  end

  it 'links to edit button' do
    visit "/countries/#{@country.id}/warrooms"
    click_button("Edit #{@wr.warroom_name}")

    expect(current_path).to eq("/countries/#{@country.id}/warrooms/#{@wr.id}/edit")
  end

  it 'can push edit' do
    visit "/countries/#{@country.id}/warrooms/#{@wr.id}/edit"

    fill_in(:warroom_name, with: "Sector 2C")
    fill_in(:strategic_importance, with: "4")
    fill_in(:deadman_switch, with: "true")
    fill_in(:contains_wmd, with: "false")

    click_button("Update #{@wr.warroom_name}")

    #save_and_open_page

    expect(current_path).to eq("/countries/#{@country.id}/warrooms/#{@wr.id}")
    expect(page).to have_content("Sector 2C")
    expect(page).to have_content("4")
    expect(page).to have_content("true")
    expect(page).to have_content("false")
  end

  it 'can show warrooms above or at a specific strategic importance' do
    visit "/countries/#{@country.id}/warrooms"

    fill_in(:x, with: "4")
    click_button("Only return records of or greater than x of strategic importance")

    save_and_open_page

    expect(page).to_not have_content("Sector 2C")
  end

end
