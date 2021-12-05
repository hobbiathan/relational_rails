require 'rails_helper'

RSpec.describe 'countries#new' do

  it 'shows proper field inputs' do
    visit "/countries/new"

    expect(page).to have_field("country_name")
    expect(page).to have_field("military_power_rank")
    expect(page).to have_field("nuclear_power")
  end
end
