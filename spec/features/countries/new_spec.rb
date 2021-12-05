require 'rails_helper'

RSpec.describe 'countries#new' do

  it 'shows proper field inputs' do
    visit "/countries/new"

    expect(page).to have_field("CountryName")
    expect(page).to have_field("MilitaryPowerRank")
    expect(page).to have_field("NuclearPower")
  end
end
