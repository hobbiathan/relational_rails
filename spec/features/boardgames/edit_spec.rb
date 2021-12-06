require 'rails_helper'

RSpec.describe 'Update boardgame with new Data' do
  it 'links to the edit page' do
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)

    visit "/boardgames/#{@puerto.id}"


    expect(page).to have_link("Update Board Game")

    click_link "Update Board Game"

    expect(current_path).to eq("/boardgames/#{@puerto.id}/edit")
  end
  it 'can edit the boardgame' do
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Ric', rank: 244, out_of_print: false)
    visit "/boardgames/#{@puerto.id}"
    expect(page).to have_content("Puerto Ric")
    expect(page).to have_content(244)
    expect(page).to have_content(false)
    click_link "Update Board Game"

    within '.update-boardgame' do
      fill_in :name, with: 'Puerto Rico'
      fill_in :rank, with: 110
      select(:false, from: :out_of_print )
      click_button 'Submit Update'
    end
    expect(current_path).to eq("/boardgames/#{@puerto.id}")

    expect(page).to have_content(@puerto.name)
    expect(page).to have_content(110)
    expect(page).to have_content(false)
  end
end
