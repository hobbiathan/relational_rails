# User Story 14, Child Update (x2)
#
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
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

    within '.update-boardgame'
      fill_in :name, with: 'Puerto Rico'
      fill_in :rank, with: 110
      select(:false, from: :out_of_print )
      click_button 'Submit Update'

    expect(current_path).to eq("/boardgames/#{@puerto.id}")
    expect(page).to have_content("Puerto Rico")
    expect(page).to have_content(110)
    expect(page).to have_content(false)

  end
end
