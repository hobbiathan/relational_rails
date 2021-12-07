require 'rails_helper'

RSpec.describe 'the boardgames index page', type: :feature do
  it 'shows only true records of out_of_print' do
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
    @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
    @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
    @gloomhaven = @cephalofair.boardgames.create!(name: 'Gloomhaven', rank: 239, out_of_print: true)
    @forge = @cephalofair.boardgames.create!(name: 'Forgwar', rank: 89, out_of_print: false)
    visit '/boardgames'

    expect(page).to have_content(@gloomhaven.name)
    expect(page).to have_content(@gloomhaven.rank)
    expect(page).to have_content(@gloomhaven.out_of_print)
    expect(page).to_not have_content(@forge.name)
    expect(page).to_not have_content(@forge.rank)
    expect(page).to_not have_content(@forge.out_of_print)
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
  it 'has a button next to every boardgame to delete that boardgame' do
    @emperors = Company.create!(name: "Emperors of Eternal Evil", games_invented: 12, independent: true)
    @war_cults = @emperors.boardgames.create!(name: "war cults", rank: 144, out_of_print: true)
    @cave_evil = @emperors.boardgames.create!(name: "Cave Evil", rank: 7, out_of_print: true)
    visit '/boardgames'

    first(:button, "Delete").click

    expect(page).to_not have_content(@war_cults.name)

    first(:button, "Delete").click
    expect(page).to_not have_content(@cave_evil.name)
  end
end
