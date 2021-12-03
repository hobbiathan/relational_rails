require 'rails_helper'
RSpec.describe 'Companies boardgames index' do
  before :each do
    @riogrande = Company.create!(name: "Rio Grande")
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
    @catan = @riogrande.boardgames.create!(name: 'Catan')
  end
  it 'shows all the boardgames for the artist' do
    #user story 5
    visit "/companies/#{@riogrande.id}/boardgames"
    # within '.boardgames-list' do
    expect(page).to have_content(@puerto.name)
    expect(page).to have_content(@catan.name)
  end
  it 'links to each boardgames show page' do
    visit "/companies/#{@riogrande.id}/boardgames"


    click_on @puerto.name

    # within '.boardgames-list' do
      expect(current_path).to eq("/boardgames/#{@puerto.id}")
      
    end

end
