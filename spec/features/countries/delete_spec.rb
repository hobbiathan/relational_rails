require 'rails_helper'

RSpec.describe 'countries#destroy' do
  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
  end

  it 'can delete a given country' do
    visit "/countries/#{@country.id}"

    click_button("Delete #{@country.country_name}")
    
    expect(current_path).to eq('/countries')
    expect(page).to_not have_content("The Velviathan")
  end
end
