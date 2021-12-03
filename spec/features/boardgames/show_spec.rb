require 'rails_helper'

RSpec.describe 'the boardgames index page', type: :feature do
  it 'lists all the boardgames and attributes' do
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
end
