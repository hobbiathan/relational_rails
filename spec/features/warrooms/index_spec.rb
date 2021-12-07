RSpec.describe 'warrooms' do

  before(:each) do
    @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
    @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)
    @wr = @country.warrooms.create!(strategic_importance: 5, warroom_name: "Sector 2B", deadman_switch: true, contains_wmd: true)
    @wr_2 = @country_two.warrooms.create!(strategic_importance: 4, warroom_name: "Khoslin", deadman_switch: false, contains_wmd: true)
    @wr_3 = @country_two.warrooms.create!(strategic_importance: 4, warroom_name: "Mostina", deadman_switch: false, contains_wmd: false)

  end

  it 'can display proper links' do
    visit "/warrooms"

    expect(page).to have_link("Return to Countries", :href => "/countries")
  end

  it 'can display all warrooms and their information' do

    visit "/warrooms"

    expect(page).to have_content(@wr.warroom_name)
    expect(page).to have_content(@wr.id)
    expect(page).to have_content(@wr.strategic_importance)
    expect(page).to have_content(@wr.deadman_switch)
    expect(page).to have_content(@wr.contains_wmd)
    expect(page).to have_content(@wr.created_at)
    expect(page).to have_content(@wr.updated_at)
    expect(page).to have_content(@wr.country_id)

    expect(page).to have_content(@wr_2.warroom_name)
    expect(page).to have_content(@wr_2.id)
    expect(page).to have_content(@wr_2.strategic_importance)
    expect(page).to have_content(@wr_2.deadman_switch)
    expect(page).to have_content(@wr_2.contains_wmd)
    expect(page).to have_content(@wr_2.created_at)
    expect(page).to have_content(@wr_2.updated_at)
    expect(page).to have_content(@wr_2.country_id)

  end

  it 'can display only warrooms that contain wmds' do
    visit '/warrooms'

    expect(page).to_not have_content('Mostina')
  end

  it 'can organize by name' do
    visit '/warrooms'

    click_link("Order by Name")

    expect(page).to have_content("Khoslin")
    expect(page).to have_content("Sector 2B")
  end

end
