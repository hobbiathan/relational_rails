require 'rails_helper'

RSpec.describe 'countries#new' do
  it 'links to new page from artists#index' do
    visit '/countries'

    click_link("Create Country")
    expect(current_path).to eq("/countries/new")
  end

  it 'can create a new country' do
    visit '/countries/new'

    fill_in(:country_name, with: 'Switzerland')
    fill_in(:military_power_rank, with: "2")
    fill_in(:nuclear_power, with: "false")

    click_button('Create Country')

    expect(current_path).to eq("/countries")
    expect(page).to have_content("Switzerland")
  end
end
