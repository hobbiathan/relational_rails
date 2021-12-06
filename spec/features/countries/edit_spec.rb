require 'rails_helper'

RSpec.describe 'country#edit' do
  before(:each) do
    @country = Country.create!(country_name: "Hobbiathan State", military_power_rank: 5, nuclear_power: true)
  end

  it 'links to the edit page' do
    visit "/countries/#{@country.id}"

    click_button("Edit #{@country.country_name}")

    expect(current_path).to eq("/countries/#{@country.id}/edit")
  end

  it 'can edit country attributes' do
    visit "/countries/#{@country.id}/edit"

    fill_in(:country_name, with: "The Unified Hobbiathan State")
    fill_in(:nuclear_power, with: "false")
    fill_in(:military_power_rank, with: "5")

    click_button("Update Country")

    save_and_open_page

    expect(current_path).to eq("/countries/#{@country.id}")
    expect(page).to have_content("The Unified Hobbiathan State")
  end

end
