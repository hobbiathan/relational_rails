require 'rails_helper'

RSpec.describe 'countries#destroy' do
  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @warroom = @country.warrooms.create!(strategic_importance: 5, warroom_name: "Sector 3N", deadman_switch: true, contains_wmd: true)
  end

  it 'can delete a given country' do
    visit "/warrooms"

    click_button("Delete #{@warroom.warroom_name}")

    expect(current_path).to eq('/warrooms')
    expect(page).to_not have_content("Sector 3N")
  end
end
