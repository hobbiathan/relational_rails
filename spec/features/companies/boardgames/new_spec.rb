# User Story 13, Parent Child Creation (x2)
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'
RSpec.describe 'creating a boardgame' do
    it 'links to the new page from the boardgames index' do
      riogrande = Company.create!(name: 'Riogrande', games_invented: 192)

      visit "/companies/#{riogrande.id}/boardgames"

      click_link 'Add New Board Game'

      expect(current_path).to eq("/companies/#{riogrande.id}/boardgames/new")
    end
    it 'creates a new boardgame with a form' do
      riogrande = Company.create!(name: 'Riogrande', games_invented:192)
      visit "/companies/#{riogrande.id}/boardgames"
      click_link 'Add New Board Game'
       within ".new-boardgame" do

        fill_in :name, with: 'Catan'
        fill_in :rank, with: 125
        select(:true, from: :out_of_print )
        click_button 'Add New Board Game'


      expect(current_path).to eq("/companies/#{riogrande.id}/boardgames")
      expect(Boardgame.last[:name]).to eq('Catan')
      expect(Boardgame.last[:rank]).to eq(125)
      expect(Boardgame.last[:out_of_print]).to eq(true)
    end
  end

    it 'doesnt save boardgame without a name' do
      riogrande = Company.create!(name: 'Riogrande', games_invented: 2334)
      visit "/companies/#{riogrande.id}/boardgames"
      click_link 'Add New Board Game'
      within ".new-boardgame" do

        fill_in :name, with: nil
        fill_in :rank, with: 125
        select(:true, from: :out_of_print )

      click_button 'Add New Board Game'

      expect(Boardgame.all).to eq([])
    end
  end

    it 'doesnt save boardgame without rank' do
      riogrande = Company.create!(name: 'Riogrande', games_invented: 102)
      visit "/companies/#{riogrande.id}/boardgames"
      click_link 'Add New Board Game'
       within ".new-boardgame" do

        fill_in :name, with: "Tops"
        fill_in :rank, with: nil
        select(:true, from: :out_of_print )

      click_button 'Add New Board Game'
      expect(Boardgame.all.length).to eq(0)
    end
  end
end
