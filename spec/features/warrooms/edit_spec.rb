require 'rails_helper'

RSpec.describe 'warrooms#edit' do
  before(:each) do
    @country = Country.create!(country_name: "Hobbiathan State", military_power_rank: 5, nuclear_power: true)
    @child_warroom = @country.warrooms.create!(warroom_name: "Sector 2B", strategic_importance: "5", deadman_switch: true, contains_wmd: true)
  end

  it 'links to the edit page' do
    visit "/warrooms/#{@child_warroom.id}"

    click_button("Edit #{@child_warroom.warroom_name}")

    expect(current_path).to eq("/warrooms/#{@child_warroom.id}/edit")
  end

  it 'can edit country attributes' do
    visit "/warrooms/#{@child_warroom.id}/edit"

    fill_in(:warroom_name, with: "Sector 2C")
    fill_in(:strategic_importance, with: "4")
    fill_in(:deadman_switch, with: "true")
    fill_in(:contains_wmd, with: "false")

    click_button("Edit #{@child_warroom.warroom_name}")

    #save_and_open_page

    expect(current_path).to eq("/warrooms/#{@child_warroom.id}")
    expect(page).to have_content("Sector 2C")
    expect(page).to have_content("4")
    expect(page).to have_content("true")
    expect(page).to have_content("false")
  end

end
