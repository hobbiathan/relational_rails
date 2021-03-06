require 'rails_helper'

RSpec.describe 'the company show page', type: :feature do
  # User Story 2
  it 'displays the the specific company and attributes' do
    company = Company.create!(name: 'mattel', games_invented: 10)
    visit "/companies/#{company.id}"
    expect(page).to have_content(company.name)
  end
  #user story 7
  it 'displays the count of boardgames' do
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 63, independent: false)
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
    @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)

    visit "/companies/#{@riogrande.id}"
    within '.company-show' do
      expect(page).to have_content("Total Board Games in Database: #{@riogrande.boardgame_count}")
    end
  end
  describe 'Show Paths' do
    it 'links to the edit page' do
      riogrande = Company.create!(name: "Riogrande", games_invented: 293, independent: false)

      visit "/companies/#{riogrande.id}"
      within ".parent-edit" do

        expect(page).to have_link('Update Company', href: "/companies/#{riogrande.id}/edit")
      end
    end
    it 'links to boardgames path' do
    #user story 8
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 63, independent: false)
      @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
      visit "/companies/#{@riogrande.id}"
      within '.boardgames' do

      expect(page).to have_link('Board Games Link', href: '/boardgames')
    end
  end
end
  it 'links to the company childs index ' do
    #user story 10
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
    @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
    visit "/companies/#{@riogrande.id}"
      within '.child-games' do

      expect(page).to have_link("#{@riogrande.name}'s boardgames", href: "/companies/#{@riogrande.id}/boardgames")
    end
  end
  it 'links to company index path' do
    #user story 9
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 63, independent: false)
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
    visit "/companies/#{@riogrande.id}"
    within '.company-index' do

      expect(page).to have_link('Company Index', href: '/companies')
    end
  end
end
