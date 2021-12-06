require 'rails_helper'

RSpec.describe 'the boardgames index page', type: :feature do
  it 'lists a specific boardgame and its attributes' do
    #user story 4
    company = Company.create!(name: 'Riogrande', independent: false, games_invented: 150)
    boardgame = company.boardgames.create!(name: 'Puerto Rico', rank: 35, out_of_print: false)


    visit "/boardgames/#{boardgame.id}"
    within '.boardgames-list' do

      expect(page).to have_content(boardgame.name)
      expect(page).to have_content(boardgame.rank)
      expect(page).to have_content(boardgame.out_of_print)
      expect(page).to have_content(boardgame.created_at.httpdate)
      expect(page).to have_content(boardgame.updated_at.httpdate)
   end
 end
 it 'links to company index' do
   @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
   @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 244, out_of_print: false)

   visit "/boardgames/#{@puerto.id}"

   expect(page).to have_link("Companies Home", href: '/companies')
 end
end
