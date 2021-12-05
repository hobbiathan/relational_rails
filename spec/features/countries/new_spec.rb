require 'rails_helper'

RSpec.describe 'countries#new' do

  it 'shows proper field inputs' do
    visit "/countries/new"

    expect(page).to have_field("CountryName")
    expect(page).to have_field("StrategicImportance")
    expect(page).to have_filed("DeadmanSwitch")
    expect(page).to have_field("ContainsWMD")
  end
end
