require 'rails_helper'

RSpec.describe 'destroying an company' do
  it 'can delete the artist from the index page' do
    riogrande = Company.create!(name: "Riogrande", games_invented: 12)
    catan = riogrande.boardgames.create!(name: "Catan", rank: 2334)
    visit "/companies/#{riogrande.id}"


    click_button 'Delete Company'
    expect(current_path).to eq('/companies')
    expect(page).to_not have_content(riogrande.name)
    visit '/boardgames'
    expect(page).to_not have_content(catan.name)
  end
end
