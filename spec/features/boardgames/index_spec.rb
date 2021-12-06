require 'rails_helper'

RSpec.describe 'the boardgames index page', type: :feature do
  xit 'lists all the boardgames and attributes' do
    #user story 3
    company = Company.create!(name: 'Riogrande', independent: false, games_invented: 150)
    boardgame = company.boardgames.create!(name: 'Puerto Rico', rank: 35, out_of_print: false)
    boardgame_2 = company.boardgames.create!(name: 'Catan', rank: 5, out_of_print: false)

    visit "/boardgames"
    within '.boardgames-list' do

    expect(page).to have_content(boardgame.name)
    expect(page).to have_content(boardgame_2.name)
    expect(page).to have_content(boardgame.rank)
    expect(page).to have_content(boardgame_2.rank)
    expect(page).to have_content(boardgame.out_of_print)
    expect(page).to have_content(boardgame_2.out_of_print)
    expect(page).to have_content(boardgame.created_at.httpdate)
    expect(page).to have_content(boardgame_2.created_at.httpdate)
    expect(page).to have_content(boardgame.updated_at.httpdate)
    expect(page).to have_content(boardgame_2.updated_at.httpdate)
    end
  end
    it 'shows only true records of out_of_print' do
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
      @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
      @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
      @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
      @gloomhaven = @cephalofair.boardgames.create!(name: 'Gloomhaven', rank: 239, out_of_print: true)
      @forge = @cephalofair.boardgames.create!(name: 'Forgwar', rank: 89, out_of_print: false)
      visit '/boardgames'

      expect(page).to have_content(@gloomhaven.name)
      expect(page).to_not have_content(@catan.name)
    end
    describe '#links/buttons' do
      it 'has an edit link next to every boardgame' do
        @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
        @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
        @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
        @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
        @gloomhaven = @cephalofair.boardgames.create!(name: 'Gloomhaven', rank: 239, out_of_print: true)
        @forge = @cephalofair.boardgames.create!(name: 'Forgwar', rank: 89, out_of_print: false)
        visit "/boardgames"
        within '.boardgames-list' do

          expect(page).to have_link("Edit", href: "/boardgames/#{@gloomhaven.id}/edit")

          first(:link, "Edit").click

        expect(current_path).to eq("/boardgames/#{@gloomhaven.id}/edit")
      end
    end
    it 'links to company index' do
      visit "/boardgames"

      expect(page).to have_link("Companies Home", href: '/companies')
    end
  end
end
