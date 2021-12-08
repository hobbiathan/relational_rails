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
    save_and_open_page

    within '.update-boardgame' do
      find(".name", visible: true).set "Puerto Rico"
      find(".rank", visible: true).set 233


      click_button 'Submit Update'
    end
    expect(current_path).to eq("/boardgames/#{@puerto.id}")

    expect(page).to have_content(@puerto.name)
    expect(page).to have_content(233)
    
  end
end
